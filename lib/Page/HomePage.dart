import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:fitness_club/Home_Bar/Home_PageBar.dart';
import 'package:fitness_club/Home_Bar/Person_Page/Person_PageBar.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/Reports_PageBar.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  int myindex= 0;

  List<Widget>widgetList=[
    home_pagebar(),
    report_pagebar(),
    person_pagebar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myindex=index;
          });
        },
        currentIndex: myindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
      body: IndexedStack(
        children: widgetList,
        index: myindex,
      ),

    );
  }
}
