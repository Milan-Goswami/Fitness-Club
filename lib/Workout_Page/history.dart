// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // If you want to format dates, uncomment and add intl to pubspec.yaml
// // import 'package:intl/intl.dart';
//
// class HistoryPage extends StatelessWidget {
//   const HistoryPage({Key? key}) : super(key: key);
//
//   // Returns the correct asset path for each workout name
//   String getWorkoutImage(String workoutName) {
//     switch (workoutName.toUpperCase()) {
//       case 'ABS':
//         return 'assets/image/meditation.png';
//       case 'CHEST':
//         return 'assets/image/meditation.png';
//       case 'LEG':
//         return 'assets/image/meditation.png';
//       case 'SHOULDER':
//         return 'assets/image/meditation.png';
//       case 'BICEPS':
//         return 'assets/image/meditation.png';
//       case 'TRICEPS':
//         return 'assets/image/meditation.png';
//       default:
//       // Fallback image if name doesn't match
//         return 'assets/image/meditation.png';
//     }
//   }
//
//   // Optional helper: convert an integer duration (in seconds) to mm:ss format
//   String formatTime(int totalSeconds) {
//     final int minutes = totalSeconds ~/ 60;
//     final int seconds = totalSeconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("History")),
//       body: StreamBuilder<QuerySnapshot>(
//         // If "summary" is a subcollection, adjust your path accordingly.
//         stream: FirebaseFirestore.instance
//             .collection('summary').snapshots(),
//         builder: (context, snapshot) {
//           // 1. Loading state
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           // 2. No data or empty
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text('No history found'));
//           }
//
//           // 3. We have data: retrieve docs
//           final historyDocs = snapshot.data!.docs;
//
//           // 4. Sort by timestamp (descending), so latest added data is first
//           historyDocs.sort((a, b) {
//             final aData = a.data() as Map<String, dynamic>;
//             final bData = b.data() as Map<String, dynamic>;
//             final aTimestampStr = aData['timestamp'] ?? '';
//             final bTimestampStr = bData['timestamp'] ?? '';
//
//             // Try parsing each timestamp string into DateTime
//             final aTimestamp = DateTime.tryParse(aTimestampStr) ?? DateTime.fromMillisecondsSinceEpoch(0);
//             final bTimestamp = DateTime.tryParse(bTimestampStr) ?? DateTime.fromMillisecondsSinceEpoch(0);
//
//             // Descending order: compare b to a
//             return bTimestamp.compareTo(aTimestamp);
//           });
//
//           // 5. Determine how many total workouts
//           final totalWorkouts = historyDocs.length;
//
//           return ListView.builder(
//             itemCount: totalWorkouts,
//             itemBuilder: (context, index) {
//               final data = historyDocs[index].data() as Map<String, dynamic>;
//
//               // Safely extract fields from Firestore
//               final String workoutName = data['name'] ?? 'N/A';
//               final double calories = (data['calories'] ?? 0).toDouble();
//               // duration is stored as a number in Firestore
//               final int durationNum = (data['duration'] ?? 0).toInt();
//               // timestamp is stored as a string in Firestore
//               final String timestampStr = data['timestamp'] ?? 'N/A';
//
//               // For now, we'll just display the raw string as date/time
//               final String formattedDate = timestampStr;
//
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Local image (based on workoutName)
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.asset(
//                         getWorkoutImage(workoutName),
//                         height: 60,
//                         width: 60,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//
//                     // Text info on the right
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Date/Time
//                           Text(
//                             formattedDate,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.black45,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//
//                           // Workout name + total workouts
//                           Row(
//                             children: [
//                               Text(
//                                 "${workoutName.toUpperCase()} Exercise",
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "                       $totalWorkouts Workout${totalWorkouts > 1 ? 's' : ''}",
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 4),
//
//                           // Duration & Calories
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.timer,
//                                 size: 14,
//                                 color: Colors.blue,
//                               ),
//                               const SizedBox(width: 4),
//                               Text(formatTime(durationNum)),
//                               const SizedBox(width: 16),
//                               const Icon(
//                                 Icons.local_fire_department,
//                                 size: 14,
//                                 color: Colors.red,
//                               ),
//                               const SizedBox(width: 4),
//                               Text('${calories.toStringAsFixed(1)} Kcal'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }





















import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// If you want to format dates, uncomment and add intl to pubspec.yaml
// import 'package:intl/intl.dart';
final User? currentUser = FirebaseAuth.instance.currentUser;

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  String getWorkoutImage(String workoutName) {
    switch (workoutName.toUpperCase()) {
      case 'ABS':
        return 'assets/image/g1.png';
      case 'CHEST':
        return 'assets/image/g2.png';
     case 'LEG':
       return 'assets/image/g5.png';
       case 'SHOULDER':
         return 'assets/image/g4.png';
       case 'BICEPS':
         return 'assets/image/g3.png';
       case 'TRICEPS':
         return'assets/image/g6.png';
       default:
        return 'assets/image/g1.png';
     }
   }


// For testing
 /* String getWorkoutImage(String workoutName) {
    switch (workoutName.toUpperCase()) {
      case 'ABS':
        return 'assets/image/meditation.png';
      case 'CHEST':
        return 'assets/image/meditation.png';
      case 'LEG':
        return 'assets/image/meditation.png';
      case 'SHOULDER':
        return 'assets/image/meditation.png';
      case 'BICEPS':
        return 'assets/image/meditation.png';
      case 'TRICEPS':
        return 'assets/image/meditation.png';
      default:
        return 'assets/image/meditation.png';
    }
  }*/

  String formatTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
   // final userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: currentUser == null
          ? const Center(child: Text('Please sign in to view history'))
          : StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Calories')
            .doc(currentUser!.email)
            .collection('summary')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No history found'));
          }

          // final historyDocs = snapshot.data!.docs;

          // historyDocs.sort((a, b) {
          //   final aData = a.data() as Map<String, dynamic>;
          //   final bData = b.data() as Map<String, dynamic>;
          //   final aTimestampStr = aData['timestamp'] ?? '';
          //   final bTimestampStr = bData['timestamp'] ?? '';
          //
          //   final aTimestamp = DateTime.tryParse(aTimestampStr) ??
          //       DateTime.fromMillisecondsSinceEpoch(0);
          //   final bTimestamp = DateTime.tryParse(bTimestampStr) ??
          //       DateTime.fromMillisecondsSinceEpoch(0);
          //
          //   return bTimestamp.compareTo(aTimestamp);
          // });


          // Get the documents in ascending order.
          final docs = snapshot.data!.docs;
          final totalDocs = docs.length;
          // Reverse the list for display so the newest workout appears first.
          final reversedDocs = docs.reversed.toList();

          return ListView.builder(
            itemCount: totalDocs,
            itemBuilder: (context, index) {

              // Get the original index (based on creation order) of this document.
              final originalIndex = docs.indexOf(reversedDocs[index]);
              // Workout number remains fixed as its creation order index + 1.
              final workoutNumber = originalIndex + 1;
              final data = snapshot.data!.docs[index].data() as Map<String, dynamic>;


              // final reverseIndex = historyDocs.length - index - 1;
              // final displayNumber = historyDocs.length - index;
              // final data = historyDocs[reverseIndex].data() as Map<String, dynamic>;


              final String workoutName = data['name'] ?? 'N/A';
              final double calories = (data['calories'] ?? 0).toDouble();
              final int durationNum = (data['duration'] ?? 0).toInt();
              final String timestampStr = data['timestamp'] ?? 'N/A';

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        getWorkoutImage(workoutName),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timestampStr,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${workoutName.toUpperCase()} Exercise",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "$workoutNumber Workout",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 14, color: Colors.blue),
                              const SizedBox(width: 4),
                              Text(formatTime(durationNum)),
                              const SizedBox(width: 16),
                              const Icon(Icons.local_fire_department,
                                  size: 14, color: Colors.red),
                              const SizedBox(width: 4),
                              Text('${calories.toStringAsFixed(1)} Kcal'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}