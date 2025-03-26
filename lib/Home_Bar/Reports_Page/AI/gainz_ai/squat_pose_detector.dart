import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SquatPoseDetectorProvider extends ChangeNotifier {
  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(
      mode: PoseDetectionMode.stream,
    ),
  );

  // Initialize FlutterTts for voice feedback.
  final FlutterTts _flutterTts = FlutterTts();

  int squatCount = 0;
  bool isSquatStarted = false;
  String feedbackMessage = '';

  SquatPoseDetectorProvider() {
    _initTts();
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  /// Processes the input image, detects the pose, and updates the squat count.
  Future<void> detectPose(InputImage inputImage) async {
    try {
      final poses = await _poseDetector.processImage(inputImage);

      if (poses.isEmpty) {
        feedbackMessage = 'No pose detected';
        notifyListeners();
        return;
      }

      final pose = poses.first;

      // Retrieve essential landmarks.
      final leftHip = pose.landmarks[PoseLandmarkType.leftHip];
      final rightHip = pose.landmarks[PoseLandmarkType.rightHip];
      final leftKnee = pose.landmarks[PoseLandmarkType.leftKnee];
      final rightKnee = pose.landmarks[PoseLandmarkType.rightKnee];
      final leftAnkle = pose.landmarks[PoseLandmarkType.leftAnkle];
      final rightAnkle = pose.landmarks[PoseLandmarkType.rightAnkle];

      if (leftHip == null ||
          rightHip == null ||
          leftKnee == null ||
          rightKnee == null ||
          leftAnkle == null ||
          rightAnkle == null) {
        feedbackMessage = 'Incomplete pose detected';
        notifyListeners();
        return;
      }

      // Calculate the knee angles using the hip-knee-ankle triplets.
      double leftKneeAngle = _calculateAngle(leftHip, leftKnee, leftAnkle);
      double rightKneeAngle = _calculateAngle(rightHip, rightKnee, rightAnkle);

      // Check vertical positions: in a squat, hips should be lower than knees.
      bool hipsLowerThanKnees = (leftHip.y > leftKnee.y) && (rightHip.y > rightKnee.y);

      // Define criteria: both knee angles must be less than a threshold (e.g. 100°)
      bool isSquat = (leftKneeAngle < 100 && rightKneeAngle < 100) && hipsLowerThanKnees;

      if (isSquat) {
        if (!isSquatStarted) {
          squatCount++;
          isSquatStarted = true;
          feedbackMessage = 'Squat detected! Count: $squatCount';
          _speakCount(squatCount);
          notifyListeners();
        }
      } else {
        // Reset the squat flag when the user returns to standing.
        isSquatStarted = false;
        feedbackMessage = 'Adjust your pose to perform a squat';
        notifyListeners();
      }
    } catch (e) {
      feedbackMessage = 'Error detecting pose: ${e.toString()}';
      debugPrint(feedbackMessage);
      notifyListeners();
    }
  }

  /// Calculates the angle (in degrees) at point B formed by three landmarks A, B, and C.
  double _calculateAngle(PoseLandmark a, PoseLandmark b, PoseLandmark c) {
    final VectorAB = Offset(b.x - a.x, b.y - a.y);
    final VectorBC = Offset(b.x - c.x, b.y - c.y);
    double dotProduct = (VectorAB.dx * VectorBC.dx) + (VectorAB.dy * VectorBC.dy);
    double magnitudeAB = sqrt(pow(VectorAB.dx, 2) + pow(VectorAB.dy, 2));
    double magnitudeBC = sqrt(pow(VectorBC.dx, 2) + pow(VectorBC.dy, 2));

    if (magnitudeAB == 0 || magnitudeBC == 0) return 0;

    double cosineAngle = dotProduct / (magnitudeAB * magnitudeBC);
    // Clamp the cosine value to avoid numerical issues.
    cosineAngle = cosineAngle.clamp(-1.0, 1.0);
    double angleInRadians = acos(cosineAngle);
    return angleInRadians * (180 / pi);
  }

  /// Speaks the squat count aloud using TTS.
  Future<void> _speakCount(int count) async {
    String countWord = _convertNumberToWord(count);
    await _flutterTts.speak(countWord);
  }

  /// Converts numbers to words for 1-10; extend as needed.
  String _convertNumberToWord(int number) {
    const numberWords = {
      1: 'one',
      2: 'two',
      3: 'three',
      4: 'four',
      5: 'five',
      6: 'six',
      7: 'seven',
      8: 'eight',
      9: 'nine',
      10: 'ten',
    };
    return numberWords[number] ?? number.toString();
  }

  /// Resets the squat counter and updates the feedback message.
  void resetCounter() {
    squatCount = 0;
    feedbackMessage = 'Counter reset';
    notifyListeners();
  }

  @override
  void dispose() {
    _poseDetector.close();
    _flutterTts.stop();
    super.dispose();
  }
}
