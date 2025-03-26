import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/pushup_workout_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../helper/dialogs.dart';
import 'pushup_pose_detector.dart'; // Use the file that contains push-up detection logic
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class PushUpWorkoutScreen extends StatefulWidget {
  @override
  _PushUpWorkoutScreenState createState() => _PushUpWorkoutScreenState();
}

class _PushUpWorkoutScreenState extends State<PushUpWorkoutScreen> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  CameraController? cameraController;
  bool isDetecting = false;
  bool isWorkoutActive = false;
  // Track when the workout was started.
  int workoutStartTime = 0;
  // Stores computed workout duration when paused.
  int? _workoutDuration;
  // Controls whether the save button is enabled.
  bool isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      // final firstCamera = cameras.first;
      // Use the front camera instead of the back camera.
      final frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      cameraController = CameraController(frontCamera, ResolutionPreset.high);
      await cameraController?.initialize();
      if (!mounted) return;

      cameraController?.startImageStream((image) async {
        if (isDetecting || !isWorkoutActive) return;
        isDetecting = true;
        try {
          final inputImage = getInputImageFromCameraImage(image);
          // Use the push-up pose detector provider to detect push-ups.
          await context.read<PushUpPoseDetectorProvider>().detectPose(inputImage);
        } catch (e) {
          debugPrint('Error in push-up detection: $e');
        } finally {
          setState(() {
            isDetecting = false;
          });
        }
      });

      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to initialize camera: $e'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    }
  }
  InputImage getInputImageFromCameraImage(CameraImage image) {
    if (cameraController == null) {
      throw Exception("CameraController is not initialized.");
    }

    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(Uint8List.fromList(plane.bytes));
    }
    final ByteData byteData = allBytes.done();
    final Uint8List bytes = byteData.buffer.asUint8List();

    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());

    final int cameraRotation = cameraController!.description.sensorOrientation;
    final InputImageRotation imageRotation;

    switch (cameraRotation) {
      case 90:
        imageRotation = InputImageRotation.rotation90deg;
        break;
      case 180:
        imageRotation = InputImageRotation.rotation180deg;
        break;
      case 270:
        imageRotation = InputImageRotation.rotation270deg;
        break;
      case 0:
      default:
        imageRotation = InputImageRotation.rotation0deg;
        break;
    }

    final InputImageFormat inputImageFormat =
    image.format.group == ImageFormatGroup.yuv420
        ? InputImageFormat.yuv420
        : InputImageFormat.nv21;

    final metadata = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation,
      format: inputImageFormat,
      bytesPerRow: image.planes[0].bytesPerRow, // Ensure it's correct for your use case
    );

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: metadata,
    );
  }




  // Toggle workout session; when paused, enable the save button.
  void _toggleWorkoutSession() {
    setState(() {
      if (isWorkoutActive) {
        final duration = DateTime.now().millisecondsSinceEpoch - workoutStartTime;
        _workoutDuration = duration;
        isSaveEnabled = true;
        isWorkoutActive = false;
      } else {
        workoutStartTime = DateTime.now().millisecondsSinceEpoch;
        isWorkoutActive = true;
        isSaveEnabled = false;
      }
    });
  }

  // Save the workout summary using push-up detection data.
  Future<void> _saveWorkoutSummary(int workoutDuration) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('No user is signed in');
      return;
    }

    final pushUpDetector = context.read<PushUpPoseDetectorProvider>();
    final workoutSummary = {
      'total_reps': pushUpDetector.pushUpCount,
      'duration': workoutDuration,
      'form_consistency': pushUpDetector.feedbackMessage,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await FirebaseFirestore.instance
          .collection('pushup_summary')
          .doc(currentUser!.email)
          .collection('pushup_summary')
          .add(workoutSummary);
      Fluttertoast.showToast(
        msg: "Workout summary saved successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print('Workout summary saved successfully');
    } catch (e) {
      print('Error saving workout summary: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pushUpDetector = context.watch<PushUpPoseDetectorProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Push-Up Counter'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Workout Summary'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PushUpWorkoutSummary()),
                  );
                },
              ),

            ],
          ),
        ),
        // body: cameraController != null
        //     ? Stack(
        //   fit: StackFit.expand,
        //   children: [
        //     // Rotate the CameraPreview based on sensor orientation
        //     RotatedBox(
        //       quarterTurns: cameraController!.description.sensorOrientation ~/ 90,
        //       child: CameraPreview(cameraController!),
        //     ),
        //     Center(
        //       child: Text(
        //         'Count: ${pushUpDetector.pushUpCount}',
        //         style: TextStyle(
        //           fontSize: 32,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //     // Display feedback message
        //     Positioned(
        //       bottom: 20,
        //       left: 0,
        //       right: 0,
        //       child: Center(
        //         child: Text(
        //           pushUpDetector.feedbackMessage,
        //           style: TextStyle(
        //             fontSize: 18,
        //             color: Colors.yellow,
        //             fontWeight: FontWeight.bold,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ),
        //   ],
        // )
        //     : Center(child: CircularProgressIndicator()),

        body: cameraController != null
            ? Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(cameraController!),
            Center(
              child: Text(
                'Count: ${pushUpDetector.pushUpCount}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Display feedback message
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  pushUpDetector.feedbackMessage,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        )
            : Center(child: CircularProgressIndicator()),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Save button: enabled only when isSaveEnabled is true.
            FloatingActionButton(
              onPressed: isSaveEnabled
                  ? () async {
                if (_workoutDuration != null) {
                  await _saveWorkoutSummary(_workoutDuration!);
                  setState(() {
                    isSaveEnabled = false;
                    _workoutDuration = null;
                  });
                }
              }
                  : null,
              backgroundColor: isSaveEnabled ? Colors.red : Colors.red.withOpacity(0.3),
              child: Icon(Icons.save),
              tooltip: 'Save Workout',
              heroTag: null,
            ),
            SizedBox(height: 16),
            // Play/Pause toggle button.
            FloatingActionButton(
              onPressed: _toggleWorkoutSession,
              child: Icon(isWorkoutActive ? Icons.stop : Icons.play_arrow),
              tooltip: isWorkoutActive ? 'Stop Workout' : 'Start Workout',
            ),
            SizedBox(height: 16),
            // Reset counter button.
            FloatingActionButton(
              onPressed: pushUpDetector.resetCounter,
              child: Icon(Icons.refresh),
              tooltip: 'Reset Counter',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
