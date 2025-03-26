
import 'package:fitness_club/Admin_Panel/Home_bar/Home_Screen.dart';
import 'package:fitness_club/Admin_Panel/Personal_bar/personal_bar.dart';
import 'package:flutter/material.dart';

class home_bar extends StatefulWidget {
  const home_bar({super.key});

  @override
  State<home_bar> createState() => _home_barState();
}

class _home_barState extends State<home_bar> {
  int myindex= 0;

  List<Widget>widgetList=[
   HomeScreen(),
    personal_bar(),
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


