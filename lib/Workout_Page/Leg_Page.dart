

import 'package:fitness_club/Workout_Page/leg_exercises/Ad4_page.dart';
import 'package:fitness_club/Workout_Page/leg_exercises/Be4_page.dart';
import 'package:fitness_club/Workout_Page/leg_exercises/in4_page.dart';
import 'package:flutter/material.dart';

class Leg_page extends StatelessWidget {
  const Leg_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leg Exericises',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
      ),

      body: PageView(
        children: [

          Column(
            children: [

              Container(
                  height: 748,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.blue,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Icon(Icons.bolt_outlined,color: Colors.red,size: 30,),
                              Icon(Icons.bolt_outlined,color: Colors.black45,size: 30,),
                              Icon(Icons.bolt_outlined,color: Colors.black45,size: 30,),

                              Center(child: Text('Beginner',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 28),)),

                            ],
                          ),

                          SizedBox(height: 20,),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('Build Leg',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('And Become Strong',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),

                              SizedBox(height: 70,),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('30 Days Left',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),


                            ],
                          )

                        ],
                      ),


                      Center(
                        child: Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight:Radius.circular(80)),
                            color:Colors.white,
                          ),

                          child:SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Exercises',style: TextStyle(
                                            fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 18),),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 30,),

                                  Container(
                                    height: 500,
                                    width: 500,
                                    color:Colors.white,

                                    child:SingleChildScrollView(
                                      child: Column(
                                          children: [

                                            Container(
                                              height: 500,
                                              width: 500,
                                              color:Colors.white,

                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));

                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day1',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));

                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day2',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day3',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day4',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day5',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day6',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day7',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day8',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day9',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day10',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day11',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day12',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day13',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day14',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day15',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day16',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day17',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day18',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day19',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day20',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day21',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day22',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day23',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day24',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day25',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day26',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day27',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day28',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day29',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Be4_page(),));
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day30',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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

                                                    SizedBox(height: 10,),

                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                        },
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[400],
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(20),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Day',
                                                                    textAlign: TextAlign.start,style: TextStyle(
                                                                      color: Colors.black,
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
                                            ),
                                          ],
                                        ),


                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),



          //Intermediate exericises

          Column(
            children: [

              Container(
                  height: 748,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.blue,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Icon(Icons.bolt_outlined,color: Colors.red,size: 30,),
                              Icon(Icons.bolt_outlined,color: Colors.red,size: 30,),
                              Icon(Icons.bolt_outlined,color: Colors.black45,size: 30,),

                              Center(child: Text('Intermediate',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 28),)),

                            ],
                          ),

                          SizedBox(height: 20,),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('Build Leg',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('And Become Strong',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),

                              SizedBox(height: 70,),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('30 Days Left',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),


                            ],
                          )

                        ],
                      ),


                      Center(
                        child: Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight:Radius.circular(80)),
                            color:Colors.white,
                          ),

                          child:SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Exericises',style: TextStyle(
                                            fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 18),),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 30,),

                                  Container(
                                    height: 500,
                                    width: 500,
                                    color:Colors.white,

                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));

                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day1',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));

                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day2',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day3',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day4',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day5',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day6',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day7',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day8',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day9',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day10',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day11',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day12',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day13',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day14',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day15',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day16',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day17',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day18',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day19',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day20',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day21',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day22',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day23',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day24',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day25',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day26',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day27',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day28',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day29',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => in4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day30',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),


          //Advanced exericises


          Column(
            children: [

              Container(
                  height: 748,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.blue,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Icon(Icons.bolt_outlined,color: Colors.red,size: 30,),
                              Icon(Icons.bolt_outlined,color: Colors.red,size: 30,),
                              Icon(Icons.bolt_outlined,color: Colors.red,size: 30,),

                              Center(child: Text('Advanced',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 28),)),

                            ],
                          ),

                          SizedBox(height: 20,),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('Build Leg',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('And Become Strong',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),

                              SizedBox(height: 70,),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text('30 Days Left',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),


                            ],
                          )

                        ],
                      ),


                      Center(
                        child: Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight:Radius.circular(80)),
                            color:Colors.white,
                          ),

                          child:SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Exericises',style: TextStyle(
                                            fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 18),),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 30,),

                                  Container(
                                    height: 500,
                                    width: 500,
                                    color:Colors.white,

                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));

                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day1',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));

                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day2',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day3',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day4',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day5',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day6',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day7',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day8',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day9',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day10',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day11',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day12',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day13',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day14',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day15',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day16',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day17',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day18',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day19',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day20',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day21',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day22',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day23',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day24',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day25',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day26',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day27',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day28',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day29',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) => Ad4_page(),));
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day30',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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

                                          SizedBox(height: 10,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 0),
                                            child: GestureDetector(
                                              onTap: (){
                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Day',
                                                          textAlign: TextAlign.start,style: TextStyle(
                                                            color: Colors.black,
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
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),



        ],
      ),
    );
  }
}
