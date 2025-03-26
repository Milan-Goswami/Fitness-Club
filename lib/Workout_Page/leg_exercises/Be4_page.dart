

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_club/Workout_Page/leg_exercises/Sbe4_page.dart';
import 'package:flutter/material.dart';

class Be4_page extends StatefulWidget {
  const Be4_page({super.key});

  @override
  State<Be4_page> createState() => _Be4_pageState();
}

class _Be4_pageState extends State<Be4_page> {

  final User? currentUser = FirebaseAuth.instance.currentUser;

  final DatabaseReference _counterRef =
  FirebaseDatabase.instance.ref().child('counter');

  final DatabaseReference _workoutRef =
  FirebaseDatabase.instance.ref().child('workout');

  double _counter = 90.0;
  int _workout = 1;

  @override
  void initState() {

    super.initState();
    _counterRef.onValue.listen((event) {
      setState(() {
        _counter = (event.snapshot.value as num?)?.toDouble() ?? 0.0;

      });
    });
    _workoutRef.onValue.listen((event) {
      setState(() {
        _workout = event.snapshot.value as int? ?? 0;
      });
    });
  }

  void _incrementCounter() {
    _counterRef.set((_counter + 90.0).toDouble());
  }
  void _incrementWorkout() {
    _workoutRef.set(_workout + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
          color:Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GestureDetector(
                onTap: () async {
                  _incrementCounter();
                  _incrementWorkout();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Sbe4_page (passedValue: "LEG"),));



                },
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child:Center(
                      child: Text(
                        'START',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,color: Colors.white
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        title: Text('30 Days',style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.black45),),
      ),

      body: Column(
        children: [
          Container(
            height: 250,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
              color:Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Icon(Icons.bolt_outlined,color: Colors.blue,size: 30,),
                    Icon(Icons.bolt_outlined,color: Colors.black45,size: 30,),
                    Icon(Icons.bolt_outlined,color: Colors.black45,size: 30,),

                    Center(child: Text('Beginner',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),)),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/Body.jpg',width: 190,height:150,)

                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('10',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),),
                      Text('            10 min',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),),
                   //   Text('90.0Kcal',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Exercise',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ,color: Colors.black45),),
                      Text('Time',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ,color: Colors.black45),),
                    //  Text('Calories',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20 ,color: Colors.black45),)
                    ],
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              color:Colors.white,
            ),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text('Exercise',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      ],
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l1.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),


                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('LUNGE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l2.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('JUMP LUNGE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l3.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('SQUATS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l4.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('BENCH SPLIT SQUATS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l5.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('SQUATS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l1.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),


                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('LUNGE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l3.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('SQUATS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l5.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('SQUATS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l2.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('JUMP LUNGE',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            Image.asset('assets/image/exercise/leg/l4.gif',height: 80,width: 80,),

                            SizedBox(width: 40,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Text('BENCH SPLIT SQUATS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: Text('x10',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),


        ],
      ),
    );
  }
}
