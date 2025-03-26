import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/gainz_ai/squat_workout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SquatWorkoutSummary extends StatefulWidget {
  const SquatWorkoutSummary({super.key});

  @override
  State<SquatWorkoutSummary> createState() => _SquatWorkoutSummaryState();
}

class _SquatWorkoutSummaryState extends State<SquatWorkoutSummary> {

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Workout Summary'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ),
        body: Center(child: Text('No user is signed in')),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Workout Summary'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SquatWorkoutScreen()),

              );
            },
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('squat_summary')
              .doc(currentUser!.email)
              .collection('squat_summary')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error fetching workout summary'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No workout summary found'));
            }

            // Get the documents in ascending order.
            final docs = snapshot.data!.docs;
            final totalDocs = docs.length;
            // Reverse the list for display so the newest workout appears first.
            final reversedDocs = docs.reversed.toList();

            return ListView.builder(
              // itemCount: snapshot.data!.docs.length,
              itemCount: totalDocs,
              itemBuilder: (context, index) {
                // Get the original index (based on creation order) of this document.
                final originalIndex = docs.indexOf(reversedDocs[index]);
                // Workout number remains fixed as its creation order index + 1.
                final workoutNumber = originalIndex + 1;
                final data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                final totalReps = data['total_reps'] ?? 0;
                final duration = data['duration'] ?? 0;
                final formConsistency = data['form_consistency'] ?? 'No feedback available';
                final workoutDate = data['timestamp']?.toDate() ?? DateTime.now();

                // final totalDocs = snapshot.data!.docs.length;
                // final workoutNumber = totalDocs - index;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildSummaryCard(
                    'Workout #$workoutNumber',
                    'Reps: $totalReps\nDuration: ${_formatDuration(duration)}\nFeedback: $formConsistency\nDate: ${DateFormat('yyyy-MM-dd HH:mm').format(workoutDate)}',
                  ),
                );
              },
            );

            // return ListView.builder(
            //   itemCount: snapshot.data!.docs.length,
            //   itemBuilder: (context, index) {
            //     final data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
            //     final totalReps = data['total_reps'] ?? 0;
            //     final duration = data['duration'] ?? 0;
            //     final formConsistency = data['form_consistency'] ?? 'No feedback available';
            //     final workoutDate = data['timestamp']?.toDate() ?? DateTime.now();
            //
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: _buildSummaryCard(
            //         'Workout #${index + 1}',
            //         'Reps: $totalReps\nDuration: ${_formatDuration(duration)}\nFeedback: $formConsistency\nDate: ${DateFormat('yyyy-MM-dd HH:mm').format(workoutDate)}',
            //
            //
            //       ),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String content) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }


  String _formatDuration(int durationMillis) {
    final duration = Duration(milliseconds: durationMillis);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    if (minutes == 0) {
      return '$seconds seconds';
    }
    return '$minutes minutes $seconds seconds';
  }
}
