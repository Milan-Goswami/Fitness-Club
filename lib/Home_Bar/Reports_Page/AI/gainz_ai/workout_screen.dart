import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/workout_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'pose_detector.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';


class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {

  final User? currentUser = FirebaseAuth.instance.currentUser;

  CameraController? cameraController;
  bool isDetecting = false;
  bool isWorkoutActive = false;
  // Tracks when the workout was started.
  int workoutStartTime = 0;
  // New state variable to store computed workout duration when workout is paused.
  int? _workoutDuration;
  // New state variable to control whether the save button is enabled.
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
          // Use provider to detect pose and update jumping jack count.
          await context.read<PoseDetectorProvider>().detectPose(inputImage);
        } catch (e) {
          debugPrint('Error in pose detection: $e');
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
            ),
          ],
        ),
      );
    }
  }

  InputImage getInputImageFromCameraImage(CameraImage image) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());

    final cameraRotation = cameraController!.description.sensorOrientation;
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

    final InputImageFormat inputImageFormat = InputImageFormat.yuv420;
    final metadata = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation,
      format: inputImageFormat,
      bytesPerRow: image.planes[0].bytesPerRow,
    );

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: metadata,
    );
  }

  // Modified toggle function to manage the save button state.
  void _toggleWorkoutSession() {
    setState(() {
      if (isWorkoutActive) {
        // Workout is being paused.
        final duration = DateTime.now().millisecondsSinceEpoch - workoutStartTime;
        _workoutDuration = duration;
        isSaveEnabled = true; // Enable save button once the workout is paused.
        isWorkoutActive = false;
      } else {
        // Workout is being started.
        workoutStartTime = DateTime.now().millisecondsSinceEpoch;
        isWorkoutActive = true;
        isSaveEnabled = false; // Disable save button during an active workout.
      }
    });
  }

  // Modified save function that uses the stored _workoutDuration.
  Future<void> _saveWorkoutSummary(int workoutDuration) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('No user is signed in');
      return;
    }

    final poseDetector = context.read<PoseDetectorProvider>();
    final workoutSummary = {
      'total_reps': poseDetector.jumpingJackCount,
      'duration': workoutDuration,
      'form_consistency': poseDetector.feedbackMessage,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await FirebaseFirestore.instance
          .collection('workout_summary')
          .doc(currentUser!.email)
          .collection('workout_summary')
          .add(workoutSummary);
      Fluttertoast.showToast(
          msg: "Workout summary saved successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Workout summary saved successfully');
    } catch (e) {
      print('Error saving workout summary: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final poseDetector = context.watch<PoseDetectorProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jumping Jacks Counter'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
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
                    MaterialPageRoute(builder: (context) => WorkoutSummaryScreen()),
                  );
                },
              ),

            ],
          ),
        ),
       body: cameraController != null
            ? Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(cameraController!),
            Center(
              child: Text(
                'Count: ${poseDetector.jumpingJackCount}',
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
                  poseDetector.feedbackMessage,
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
            // Save button: it is enabled only when isSaveEnabled is true.
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
                  : null, // when null, the button appears disabled.

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
            FloatingActionButton(
              onPressed: poseDetector.resetCounter,
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





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/workout_summary.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:provider/provider.dart';
// import '../helper/dialogs.dart';
// import 'pose_detector.dart';
// import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
//
// class WorkoutScreen extends StatefulWidget {
//   @override
//   _WorkoutScreenState createState() => _WorkoutScreenState();
// }
//
// class _WorkoutScreenState extends State<WorkoutScreen> {
//   CameraController? cameraController;
//   bool isDetecting = false;
//   bool isWorkoutActive = false;
//   int workoutStartTime = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }
//
//   Future<void> initializeCamera() async {
//     try {
//       final cameras = await availableCameras();
//       final frontCamera = cameras.firstWhere(
//             (camera) => camera.lensDirection == CameraLensDirection.front,
//       );
//       cameraController = CameraController(frontCamera, ResolutionPreset.high);
//       await cameraController?.initialize();
//       if (!mounted) return;
//
//       cameraController?.startImageStream((image) async {
//         if (isDetecting || !isWorkoutActive) return;
//         isDetecting = true;
//
//         try {
//           final inputImage = getInputImageFromCameraImage(image);
//           await context.read<PoseDetectorProvider>().detectPose(inputImage); // Await the async method
//         } catch (e) {
//           // Handle error in pose detection
//           debugPrint('Error in pose detection: $e');
//         } finally {
//           setState(() {
//             isDetecting = false; // Ensure detection flag is reset after processing
//           });
//         }
//       });
//
//       setState(() {});
//     } catch (e) {
//       // Handle camera initialization error
//       print('Error initializing camera: $e');
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text('Failed to initialize camera: $e'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   InputImage getInputImageFromCameraImage(CameraImage image) {
//     final WriteBuffer allBytes = WriteBuffer();
//     for (Plane plane in image.planes) {
//       allBytes.putUint8List(plane.bytes);
//     }
//     final bytes = allBytes.done().buffer.asUint8List();
//
//     final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
//
//     // Dynamically determine rotation based on device orientation
//     final cameraRotation = cameraController!.description.sensorOrientation;
//     final InputImageRotation imageRotation;
//     switch (cameraRotation) {
//       case 90:
//         imageRotation = InputImageRotation.rotation90deg;
//         break;
//       case 180:
//         imageRotation = InputImageRotation.rotation180deg;
//         break;
//       case 270:
//         imageRotation = InputImageRotation.rotation270deg;
//         break;
//       case 0:
//       default:
//         imageRotation = InputImageRotation.rotation0deg;
//         break;
//     }
//
//     final InputImageFormat inputImageFormat = InputImageFormat.yuv420;
//
//     final metadata = InputImageMetadata(
//       size: imageSize,
//       rotation: imageRotation,
//       format: inputImageFormat,
//       bytesPerRow: image.planes[0].bytesPerRow,
//     );
//
//     return InputImage.fromBytes(
//       bytes: bytes,
//       metadata: metadata,
//     );
//   }
//
//
//   void _toggleWorkoutSession() {
//     setState(() {
//       if (isWorkoutActive) {
//         // Calculate the duration of the workout when stopping
//         final workoutDuration = DateTime.now().millisecondsSinceEpoch - workoutStartTime;
//         // Save the workout summary
//         _saveWorkoutSummary(workoutDuration);
//       } else {
//         // Start workout session
//         workoutStartTime = DateTime.now().millisecondsSinceEpoch;
//       }
//       isWorkoutActive = !isWorkoutActive;
//     });
//   }
//
//   Future<void> _saveWorkoutSummary(int workoutDuration) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       // Handle case when user is not signed in
//       print('No user is signed in');
//       return;
//     }
//
//     final poseDetector = context.read<PoseDetectorProvider>();
//     final workoutSummary = {
//       'total_reps': poseDetector.jumpingJackCount,
//       'duration': workoutDuration,
//       'form_consistency': poseDetector.feedbackMessage, // You may need a more robust measure for form consistency
//       'timestamp': FieldValue.serverTimestamp(),
//     };
//
//     try {
//       await FirebaseFirestore.instance
//           .collection('workout_users')
//           .doc(user.uid)
//           .collection('workout_summary')
//           .add(workoutSummary);
//       print('Workout summary saved successfully');
//       // Remove navigation to WorkoutSummaryScreen here
//     } catch (e) {
//       print('Error saving workout summary: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final poseDetector = context.watch<PoseDetectorProvider>();
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Jumping Jacks Counter'),
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.history),
//                 title: Text('Workout Summary'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => WorkoutSummaryScreen()),
//                   );
//                 },
//               ),
//
//             ],
//           ),
//         ),
//         body: cameraController != null
//             ? Stack(
//           fit: StackFit.expand,
//           children: [
//             CameraPreview(cameraController!),
//             Center(
//               child: Text(
//                 'Count: ${poseDetector.jumpingJackCount}',
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             // Display feedback message
//             Positioned(
//               bottom: 20,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Text(
//                   poseDetector.feedbackMessage,
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.yellow,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         )
//             : Center(child: CircularProgressIndicator()),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             FloatingActionButton(
//               onPressed: () async {
//                 // Save workout summary when pressed
//                 final workoutDuration = DateTime.now().millisecondsSinceEpoch - workoutStartTime;
//                 await _saveWorkoutSummary(workoutDuration);
//               },
//               child: Icon(Icons.save),
//               tooltip: 'Save Workout',
//               heroTag: null,
//             ),
//             SizedBox(height: 16),
//             FloatingActionButton(
//               onPressed: _toggleWorkoutSession,
//               child: Icon(isWorkoutActive ? Icons.stop : Icons.play_arrow),
//               tooltip: isWorkoutActive ? 'Stop Workout' : 'Start Workout',
//             ),
//             SizedBox(height: 16),
//             FloatingActionButton(
//               onPressed: poseDetector.resetCounter,
//               child: Icon(Icons.refresh),
//               tooltip: 'Reset Counter',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     cameraController?.dispose();
//     super.dispose();
//   }
// }

