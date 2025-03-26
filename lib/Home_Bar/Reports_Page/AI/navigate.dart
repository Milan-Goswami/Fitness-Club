// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:untitled4/gainz_ai/squat_workout_screen.dart';
// import 'gainz_ai/workout_screen.dart';
// import 'gainz_ai/workout_summary.dart';
//
// class NavigatePage extends StatefulWidget {
//   @override
//   _NavigatePageState createState() => _NavigatePageState();
// }
//
// class _NavigatePageState extends State<NavigatePage> {
//   int _selectedIndex = 0;
//
//   static List<Widget> _widgetOptions = <Widget>[
//     WorkoutScreen(),
//     WorkoutSummaryScreen(),
//     SquatWorkoutScreen()
//
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fitness_center),
//             label: 'Pose Detector',
//             backgroundColor: CupertinoColors.activeBlue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.summarize),
//             label: 'Workout Summary',
//             backgroundColor: CupertinoColors.activeBlue,
//           ),
//
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }


import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/pose_detector.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/pushup_pose_detector.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/pushup_workout_screen.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/squat_pose_detector.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/squat_workout_screen.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/workout_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';


Future<void> requestPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.location,
    Permission.notification,
    Permission.bluetooth,
    Permission.accessMediaLocation,
    Permission.microphone,
    Permission.photos,
    Permission.videos,
    Permission.sensors,
    Permission.activityRecognition,
  ].request();

  if (kDebugMode) {
    statuses.forEach((permission, status) {
      print('$permission: $status');
    });
  }
}


class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {

    // Example data
    final List<Map<String, dynamic>> exerciseData = [
      {
        'title': 'Jumping Jack Count',
        'subtitle1': 'Personal AI Trainer',
        'subtitle2': 'Full Body Gym',
        'bgColor': Colors.lightBlueAccent.shade100,
        'image': 'assets/exercise/jack.png', // Replace with actual image asset or network image
      },
      {
        'title': 'Squat Count',
        'subtitle1': 'Personal AI Trainer',
        'subtitle2': 'Full Body Gym',
        'bgColor': Colors.pink.shade100,
        'image': 'assets/exercise/squat.png',
      },
      {
        'title': 'PushUp Count',
        'subtitle1': 'AI Fitness Instructor',
        'subtitle2': 'The Power Body',
        'bgColor': Colors.orange.shade100,
        'image': 'assets/exercise/pushup.png',

      },
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text('AI Coach',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exerciseData.length,
              itemBuilder: (context, index) {
                final item = exerciseData[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  color: item['bgColor'],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image (replace with real asset or network image)
                        Center(
                          child: SizedBox(
                            height:200,
                            
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(item['subtitle1'],style: TextStyle(color: Colors.black,fontSize: 18),),
                        Text(item['subtitle2'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              if(item['title'] == "Jumping Jack Count")
                                {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => WorkoutScreen()),
                                  );
                                }
                              else if(item['title'] == "Squat Count"){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => SquatWorkoutScreen()),
                                );
                              }
                              else if(item['title'] == "PushUp Count"){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => PushUpWorkoutScreen()),
                                );
                              }
                            },
                            child: const Text('Start',style: TextStyle(fontSize: 20),),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChipWidget({
    Key? key,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {
        // Handle filter chip selection
      },
    );
  }
}