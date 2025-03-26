import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PushUpPoseDetectorProvider extends ChangeNotifier {
  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(
      mode: PoseDetectionMode.stream,
    ),
  );

  // Initialize FlutterTts for voice feedback.
  final FlutterTts _flutterTts = FlutterTts();

  int pushUpCount = 0;
  // This flag tracks if the user is in the down position (arms bent).
  bool isPushUpDown = false;
  String feedbackMessage = '';

  PushUpPoseDetectorProvider() {
    _initTts();
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  /// Processes the input image, detects the pose, and updates the push-up count.
  Future<void> detectPose(InputImage inputImage) async {
    try {
      final poses = await _poseDetector.processImage(inputImage);

      if (poses.isEmpty) {
        feedbackMessage = 'No pose detected';
        notifyListeners();
        return;
      }

      final pose = poses.first;

      // Retrieve essential landmarks for push-up detection.
      final leftShoulder = pose.landmarks[PoseLandmarkType.leftShoulder];
      final rightShoulder = pose.landmarks[PoseLandmarkType.rightShoulder];
      final leftElbow = pose.landmarks[PoseLandmarkType.leftElbow];
      final rightElbow = pose.landmarks[PoseLandmarkType.rightElbow];
      final leftWrist = pose.landmarks[PoseLandmarkType.leftWrist];
      final rightWrist = pose.landmarks[PoseLandmarkType.rightWrist];

      if (leftShoulder == null ||
          rightShoulder == null ||
          leftElbow == null ||
          rightElbow == null ||
          leftWrist == null ||
          rightWrist == null) {
        feedbackMessage = 'Incomplete pose detected';
        notifyListeners();
        return;
      }

      // Calculate the elbow angles using shoulder-elbow-wrist triplets.
      double leftElbowAngle = _calculateAngle(leftShoulder, leftElbow, leftWrist);
      double rightElbowAngle = _calculateAngle(rightShoulder, rightElbow, rightWrist);

      // Define thresholds for detecting push-up phases.
      // Down phase: elbows are bent (angle less than 90°)
      // Up phase: arms are nearly straight (angle greater than 160°)
      if (leftElbowAngle < 90 && rightElbowAngle < 90) {
        if (!isPushUpDown) {
          isPushUpDown = true;
          feedbackMessage = 'Down position detected';
          notifyListeners();
        }
      } else if (isPushUpDown && leftElbowAngle > 160 && rightElbowAngle > 160) {
        pushUpCount++;
        isPushUpDown = false;
        feedbackMessage = 'Push-up completed! Count: $pushUpCount';
        _speakCount(pushUpCount);
        notifyListeners();
      } else {
        // Intermediate state: guiding the user to complete the movement.
        feedbackMessage = 'Maintain proper form for push-ups';
        notifyListeners();
      }
    } catch (e) {
      feedbackMessage = 'Error detecting pose: ${e.toString()}';
      debugPrint(feedbackMessage);
      notifyListeners();
    }
  }

  /// Calculates the angle (in degrees) at point B formed by landmarks A, B, and C.
  double _calculateAngle(PoseLandmark a, PoseLandmark b, PoseLandmark c) {
    final vectorAB = Offset(b.x - a.x, b.y - a.y);
    final vectorBC = Offset(b.x - c.x, b.y - c.y);
    double dotProduct = (vectorAB.dx * vectorBC.dx) + (vectorAB.dy * vectorBC.dy);
    double magnitudeAB = sqrt(pow(vectorAB.dx, 2) + pow(vectorAB.dy, 2));
    double magnitudeBC = sqrt(pow(vectorBC.dx, 2) + pow(vectorBC.dy, 2));

    if (magnitudeAB == 0 || magnitudeBC == 0) return 0;

    double cosineAngle = dotProduct / (magnitudeAB * magnitudeBC);
    // Clamp the cosine value to avoid numerical issues.
    cosineAngle = cosineAngle.clamp(-1.0, 1.0);
    double angleInRadians = acos(cosineAngle);
    return angleInRadians * (180 / pi);
  }

  /// Speaks the push-up count aloud using TTS.
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

  /// Resets the push-up counter and updates the feedback message.
  void resetCounter() {
    pushUpCount = 0;
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
