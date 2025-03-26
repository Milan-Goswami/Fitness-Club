

import 'package:fitness_club/OnBroadingPage/PersonDetails.dart';
import 'package:fitness_club/OnBroadingPage/content.dart';
import 'package:flutter/material.dart';

class Onbroading extends StatefulWidget {
   Onbroading({super.key});

  @override
  State<Onbroading> createState() => _OnbroadingState();
}

class _OnbroadingState extends State<Onbroading> {

 int CurrentIndex =0;

late PageController _controller;

 @override
  void initState() {
    // TODO: implement initState
   _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
                itemCount: content.length,
                onPageChanged:(int index) {
                    setState(() {
                      CurrentIndex = index;
                    });
                },

                itemBuilder: (_,i){
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(content[i].image,height: 300,),


                        Text(content[i].title,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 20,),

                        Text(content[i].discription,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.grey),),
                      ],
                    ),
                  );
            }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(content.length, (index) => buildContainer(index,context),)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                if(CurrentIndex == content.length -1)
                  {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PersonPage(),));
                  }
                _controller.nextPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn);
              },
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      CurrentIndex == content.length -1 ?"Continue":"Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
}

