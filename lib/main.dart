import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/pose_detector.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/pushup_pose_detector.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/squat_pose_detector.dart';
import 'package:fitness_club/Page/Splashpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Add your provider here
      providers: [
        ChangeNotifierProvider(create: (context) => PoseDetectorProvider()),
        ChangeNotifierProvider(create: (context) => SquatPoseDetectorProvider()),
        ChangeNotifierProvider(create: (context) => PushUpPoseDetectorProvider()),

      ],
      child: const MaterialApp(
        title: 'fitnessapp',
        debugShowCheckedModeBanner: false,
        home: Splash_page(),
      ),

    );
  }
}



