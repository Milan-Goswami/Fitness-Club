import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/AI/navigate.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/BMI/BMI_page.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/Diet/Diet_Plan.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/Run/RUN_TRA.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/Yoga/Yoga_page.dart';
import 'package:fitness_club/Workout_Page/history.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class report_pagebar extends StatelessWidget {
   report_pagebar({super.key});

   final user = FirebaseAuth.instance.currentUser;

  final User? currentUser = FirebaseAuth.instance.currentUser;


  // Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() {
    // return FirebaseFirestore.instance
    //     .collection("CaloriesCount")
     //   .doc(currentUser!.email)
    //    .snapshots(); // Listening for real-time updates
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Reports",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black),
                  ),
                ],
              ),


              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("Calories")
                    .doc(currentUser!.email)
                    .collection("history")
                    .doc("history")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Error fetching workout summary'));
                  } else if (snapshot.hasData && snapshot.data!.exists) {
                    final userData = snapshot.data!.data();
                    final String workout = userData?['workout']?.toString() ??
                        'N/A';
                    final String calories = userData?['calories'] != null
                        ? "${(userData?['calories'] as num)
                        .toDouble()
                        .toStringAsFixed(2)} Kcal"
                        : 'N/A';
                    final String total = userData?['total'] != null
                        ? formatTime((userData?['total'] as num).toInt())
                        : 'N/A';

                    return buildStatsRow(context, workout, calories, total);
                  } else {
                    return buildStatsRow(context, "N/A", "N/A", "N/A");
                  }
                },
              ),

              SizedBox(
                height: 20,
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => yoga_page()));
                        },
                        child: Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(borderRadius: BorderRadius
                              .circular(20),
                            color: Colors.white,),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                children: [

                                  Image.asset(
                                    'assets/image/meditation.png', height: 60,),

                                  Text(
                                    'YOGA',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Bmi_page(),));
                        },
                        child: Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(borderRadius: BorderRadius
                              .circular(20),
                            color: Colors.white,),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                children: [

                                  Image.asset(
                                    'assets/image/bmi.png', height: 60,),

                                  Text(
                                    'B M I',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => StopwatchScreen()));
                        },
                        child: Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(borderRadius: BorderRadius
                              .circular(20),
                            color: Colors.white,),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                children: [

                                  Image.asset(
                                    'assets/image/running.png', height: 60,),


                                  Text(
                                    'RUN TRACKERS',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => NavigatePage()));
                        },
                        child: Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(borderRadius: BorderRadius
                              .circular(20),
                            color: Colors.white,),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                children: [

                                  Image.asset(
                                    'assets/image/ai.png', height: 60,),


                                  Text(
                                    'AI',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Diet_Page(),));
                        },
                        child: Container(
                          height: 130,
                          width: 140,
                          decoration: BoxDecoration(borderRadius: BorderRadius
                              .circular(20),
                            color: Colors.white,),

                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                children: [

                                  Image.asset(
                                    'assets/image/diet.png', height: 60,),

                                  Text(
                                    'DIET PLAN',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


    Widget buildStatsRow(BuildContext context,String workout, String calories, String total) {
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
        },
        child: Container(
          height: 160,
          width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Workouts Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade50,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/image/goldmedal.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      workout,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Workouts',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),

                // Calories Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade50,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/image/fire.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      calories,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Kcal',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),

                // Time Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade50,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/image/clock.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      total,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Minute',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

    }


    String formatTime(int seconds) {
      int minutes = seconds ~/ 60;
      int secs = seconds % 60;
      return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }

}
