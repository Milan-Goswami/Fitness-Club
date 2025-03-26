
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Workout_Page/Abs_exericises/content.dart';
import 'package:fitness_club/Workout_Page/triceps_exercises/Be6_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
String storedValue = "";

class Sbe6_page extends StatefulWidget {
  final String passedValue;
  const Sbe6_page({super.key, required this.passedValue});

  @override
  State<Sbe6_page> createState() => _Sbe6_pageState();
}

class _Sbe6_pageState extends State<Sbe6_page> {
// Approximate MET values for each exercise title

  bool _hasStoredWorkout = false;

  bool _isPaused = false;
  late Stopwatch _pausableStopwatch;
  // Track the current user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  int globalDuration = 0;

  // PageView index
  int CurrentIndex = 0;
  late PageController _controller;

  // Stopwatch to measure time on each exercise
  late Stopwatch _stopwatch;
  Timer? _timer;

  int workoutCount = 0;

  // Keep track of total calories
  double totalCalories = 0.0;

  // User weight (in kg) fetched from Firestore
  double userWeight = 0.0;

  // Approximate MET values for each exercise title
  final Map<String, double> exerciseMet = {
    "TRICEPS PUSH UP": 6.0,
    "TRICEP BACK DUMPBLE": 3.5,
    "TRICEPS RAISE": 3.5,
    "DOWN UP RAISE": 3.8,
    "BACK DUMPBLE RAISE": 3.5,
    "TRICEP PUSH DOWN": 3.5,
  };

  // Fetch the user's weight from Firestore and store it in userWeight variable
  Future<void> fetchUserWeight() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Data') // Make sure the collection name is correct
          .doc(currentUser!.email) // Using UID as document ID; adjust if needed
          .get();

      if (userDoc.exists &&
          userDoc.data() != null &&
          userDoc['weight'] != null) {
        setState(() {
          userWeight = (userDoc['weight'] as num).toDouble();
          // userWeight = double.tryParse(userDoc['weight'].toString()) ?? 0.0;
        });
        print("Fetched Weight: $userWeight kg");
      } else {
        print("User document does not exist or 'weight' field is missing!");
      }
    } catch (e) {
      print("Error fetching user weight: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    storedValue = widget.passedValue;
    totalCalories = 0.0;
    fetchUserWeight();
    print("Current User: ${currentUser?.email}");

    _controller = PageController(initialPage: 0);

    // Start the always-running stopwatch
    _stopwatch = Stopwatch()..start();
    // Start the pausable stopwatch (for pause/resume functionality)
    _pausableStopwatch = Stopwatch()..start();

    // Update UI every second (updates both stopwatches)
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // When leaving the screen, store progress
    // _storePartialWorkout();
    _timer?.cancel();
    _stopwatch.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      await _storePartialWorkout(); // Wait for Firestore write
      return true;
    },
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Beginer',style: TextStyle( color: Colors.black45,fontWeight: FontWeight.bold),),
      ),
      body:  Column(
        children: [
          // Display the pausable timer
          Text(
            "Timer: ${_pausableStopwatch.elapsed.inSeconds}s${_isPaused ? " (Paused)" : ""}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: content16.length,
              onPageChanged: (int index) {
                setState(() {
                  CurrentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          content16.length,
                              (index) => buildContainer(index, context),
                        ),
                      ),
                      Image.asset(
                        content16[i].image,
                        height: 400,
                        gaplessPlayback: true,
                      ),
                      Text(
                        "Time on this exercise: ${_stopwatch.elapsed.inSeconds}s${_isPaused ? "" : ""}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            content16[i].discription,
                            style: const TextStyle(
                                fontSize: 45, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            content16[i].title,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button
                GestureDetector(
                  onTap: () {
                    if (CurrentIndex > 0) {
                      int secondsSpent = _stopwatch.elapsed.inSeconds;
                      final String currentExerciseName =
                          content16[CurrentIndex].title;
                      double exerciseCals = _calculateCalories(
                          currentExerciseName, secondsSpent);
                      totalCalories += exerciseCals;
                      _stopwatch.reset();
                      setState(() {
                        CurrentIndex--;
                      });
                      _controller.previousPage(
                        duration: const Duration(microseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      CupertinoIcons.lessthan,
                      size: 80,
                      color: Colors.black45,
                    ),
                  ),
                ),
                // Pause Button with AlertDialog
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_isPaused) {
                        _pausableStopwatch.stop();
                        _stopwatch.stop();
                        _isPaused = true;
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            title: const Text("Paused"),
                            content: const Text(
                                "Workout paused. Press play to resume."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _pausableStopwatch.start();
                                    _stopwatch.start();
                                    _isPaused = false;
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("PLAY"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        _pausableStopwatch.start();
                        _stopwatch.start();
                        _isPaused = false;
                      }
                    });
                  },
                  child: Icon(
                    _isPaused
                        ? CupertinoIcons.play_circle
                        : CupertinoIcons.pause_circle,
                    size: 80,
                    color: Colors.black45,
                  ),
                ),
                // Next Button
                GestureDetector(
                  onTap: () {
                    if (CurrentIndex == content16.length - 1) {
                      _onNextExercise(isLast: true);
                    } else {
                      _onNextExercise();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      CupertinoIcons.greaterthan,
                      size: 80,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
  Container buildContainer(int index, BuildContext context) {
    return Container(
      height: 10,
      width: CurrentIndex == index ? 25 :10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black
      ),
    );
  }
  void _onNextExercise({bool isLast = false}) {
    int secondsSpent = _stopwatch.elapsed.inSeconds;
    final String currentExerciseName = content16[CurrentIndex].title;
    double exerciseCals =
    _calculateCalories(currentExerciseName, secondsSpent);
    totalCalories += exerciseCals;
    _stopwatch.reset();
    if (isLast) {
      _storePartialWorkout();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Be6_page()),
      );
    } else {
      setState(() {
        CurrentIndex++;
      });
      _controller.nextPage(
        duration: const Duration(microseconds: 100),
        curve: Curves.bounceIn,
      );
    }
  }

  Future<void> _storePartialWorkout() async {
    if (_hasStoredWorkout) return; // Exit if already stored
    _hasStoredWorkout = true; // Mark as stored

    // Increment the global workout count
    workoutCount++;

    // final User? currentUser = FirebaseAuth.instance.currentUser;
    // if (currentUser == null) return;

    //  final user = FirebaseAuth.instance.currentUser;

    // Calculate calories for the current exercise
    int secondsSpent = _stopwatch.elapsed.inSeconds;
    final String currentExerciseName = content16[CurrentIndex].title;
    double exerciseCals = _calculateCalories(currentExerciseName, secondsSpent);
    totalCalories += exerciseCals;
    _stopwatch.stop();

    globalDuration = _pausableStopwatch.elapsed.inSeconds;

    final now = DateTime.now();
    // final dateString = "${now.year}-${now.month}-${now.day}";
    final dateString = DateFormat("MMMM d, h:mm a").format(now);

    try {
      // Update summary with the total calories
      await FirebaseFirestore.instance
          .collection('Calories')
          .doc(currentUser!.email)
          .collection('summary')
      // .doc('summary') // You can use a constant ID or a generated one
          .add({
        'name': storedValue,
        'calories': totalCalories,
        'timestamp': dateString,
        'duration': globalDuration, // Fix: Use actual duration, not `now.second`
      },
        // SetOptions(merge: true)

      );
      print("Summary updated successfully!");

      // Update history using increment
      await FirebaseFirestore.instance
          .collection('Calories')
          .doc(currentUser!.email)
          .collection('history')
          .doc('history') // You can use a constant ID or a generated one
          .set({
        'calories': FieldValue.increment(totalCalories),
        'workout': FieldValue.increment(1),
        'total': FieldValue.increment(globalDuration),
      }, SetOptions(merge: true));
      print("History updated successfully!");
    } catch (e) {
      print("Firestore Error: $e");
    }
  }

  double _calculateCalories(String exerciseTitle, int secondsSpent) {
    double met = exerciseMet[exerciseTitle] ?? 4.0;
    double hours = secondsSpent / 3600.0;
    return met * userWeight * hours;
  }
}
