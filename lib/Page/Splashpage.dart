

import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Admin_Panel/home_bar.dart';
import 'package:fitness_club/Page/HomePage.dart';
import 'package:fitness_club/Page/Intropage.dart';
import 'package:flutter/material.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({super.key});

  @override
  State<Splash_page> createState() => _Splash_pageState();

}

class _Splash_pageState extends State<Splash_page> {

  final auth =FirebaseAuth.instance ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splaceHandel();

  }

  void splaceHandel()async{

    Future.delayed(Duration(seconds: 3),(){
      if(auth.currentUser?.email == 'admin123@gmail.com')
      {
        print(auth.currentUser);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home_bar()));

      }
      else if(auth.currentUser != null)
      {
        print(auth.currentUser);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_page()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Intro_page()));
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Center(child: Image.asset('assets/image/Club.jpg',height: 300,)),
          ),

          Text('Welcome to Fitness Club',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.black),),

          SizedBox(height: 20),
          CircularProgressIndicator(), // Loading indicator
          SizedBox(height: 10),
          Text(
            'Loading...',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),

    );
  }
}
