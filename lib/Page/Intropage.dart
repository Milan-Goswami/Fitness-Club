import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:fitness_club/Authenatication/SingUppage.dart';
import 'package:flutter/material.dart';

class Intro_page extends StatefulWidget {
  const Intro_page({super.key});

  @override
  State<Intro_page> createState() => _Intro_pageState();
}

class _Intro_pageState extends State<Intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(child: Image.asset('assets/image/intro.jpg')),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              "Fitness Club",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Text(
              'Fitness can be developed and maintained through regular exercise. It s important for a good quality of life.',
              textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 80,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingUp_page(),));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    'SingUp',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),
                  )),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_page(),));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),
                      )),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
