

import 'package:fitness_club/Home_Bar/Reports_Page/Yoga/YogaMusic_Page.dart';
import 'package:fitness_club/Home_Bar/Reports_Page/Yoga/YogaVideo_Page.dart';
import 'package:flutter/material.dart';

class yoga_page extends StatelessWidget {
  const yoga_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Padding(
                  padding: const EdgeInsets.all(1),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => video_page(),));


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

                              Image.asset('assets/image/meditation.png',height: 60,),

                              Text(
                                'YOGA VIDEO',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Music_Page(),));
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

                              Image.asset('assets/image/ai.png',height: 60,),


                              Text(
                                'MEDITATION MUSIC',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
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
