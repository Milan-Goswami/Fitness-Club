

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:fitness_club/Workout_Page/Abs_Page.dart';
import 'package:fitness_club/Workout_Page/Biceps_Page.dart';
import 'package:fitness_club/Workout_Page/Chest_Page.dart';
import 'package:fitness_club/Workout_Page/Leg_Page.dart';
import 'package:fitness_club/Workout_Page/Shoulder_Page.dart';
import 'package:fitness_club/Workout_Page/Triceps_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class home_pagebar extends StatelessWidget {
  const home_pagebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fitness Workout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.black),),
              ],
            ),
          ),


         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Card(
                 color: Colors.grey.shade100,
                 margin: EdgeInsets.all(10),
                 elevation: 20,
                 shadowColor: Colors.black,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Icon(Icons.bolt_outlined,color: Colors.blueAccent,size: 30,),
                        Icon(Icons.bolt_outlined,color: Colors.blueAccent,size: 30,),
                        Icon(Icons.bolt_outlined,color: Colors.blueAccent,size: 30,),



                      ],
                    ),

                    SizedBox(height: 5,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text('Select Fitness Workout',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),


                                Image.asset('assets/image/fitness.png',height: 120, width: 130,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 5,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('30 Days Challenge',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                        ],
                      ),
                    ),

                  ],
                ),

               ),
           ),

          SizedBox(height: 40,),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [

               Padding(
                 padding: const EdgeInsets.all(1),
                 child: GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => Abs_page(),));
                          },
                          child: Container(
                            height: 130,
                          width:140,
                          decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                            color: Colors.white,),

                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Column(
                                  children: [

                                    Image.asset('assets/image/g1.png',height: 60,),

                                    Text(
                                      'ABS',
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

               Padding(
                 padding: const EdgeInsets.all(1),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Chest_page(),));
                   },
                   child: Container(
                     height: 130,
                     width:140,
                     decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                       color: Colors.white,),

                     child: Padding(
                       padding: const EdgeInsets.all(20),
                       child: Center(
                         child: Column(
                           children: [

                             Image.asset('assets/image/g2.png',height: 60,),


                             Text(
                               'CHEST',
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Biceps_page(),));
                    },
                    child: Container(
                      height: 130,
                      width:140,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                        color: Colors.white,),

                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            children: [

                              Image.asset('assets/image/g3.png',height: 60,),

                              Text(
                                'BICEPS',
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

                Padding(
                  padding: const EdgeInsets.all(1),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shoulder_page(),));
                    },
                    child: Container(
                      height: 130,
                      width:140,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                        color: Colors.white,),

                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            children: [

                              Image.asset('assets/image/g4.png',height: 60,),
                              Text(
                                'SHOULDER',
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Leg_page(),));
                    },
                    child: Container(
                      height: 130,
                      width:140,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                        color: Colors.white,),

                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            children: [
                                Image.asset('assets/image/g5.png',height: 60,),
                              Text(
                                'LEG',
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

                Padding(
                  padding: const EdgeInsets.all(1),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Triceps_page(),));
                    },
                    child: Container(
                      height: 130,
                      width:140,
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                        color: Colors.white,),

                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            children: [

                              Image.asset('assets/image/g6.png',height: 60,),


                              Text(
                                'TRICEPS',
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
    );
  }
}
