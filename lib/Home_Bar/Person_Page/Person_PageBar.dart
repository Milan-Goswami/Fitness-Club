

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:fitness_club/Home_Bar/Person_Page/Setting_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../Page/aboutus.dart';

class person_pagebar extends StatelessWidget {
   person_pagebar({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

   Stream<DocumentSnapshot<Map<String, dynamic>>> getDataDetails() {
     return FirebaseFirestore.instance
         .collection("Data")
         .doc(currentUser!.email)
         .snapshots();
   }

   Stream<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() {
     return FirebaseFirestore.instance
         .collection("Users")
         .doc(currentUser!.email)
         .snapshots();
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: getUserDetails(),
                builder: (context,snapshot) {

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    Map<String, dynamic>? user = snapshot.data!.data();
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Text('Me',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 24),)
                              ],
                            ),

                            CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage('assets/image/pic.png'),
                            ),

                            Text(user!['username'],style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),),

                            SizedBox(height: 20,),

                            ListTile(
                               title: Text('PersonalDetails',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
                            ),


                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0,5),
                                        color: Colors.deepOrange.withOpacity(.2),
                                        spreadRadius: 2,
                                        blurRadius: 10

                                    )
                                  ]
                              ),
                              child: ListTile(
                                title: Text('Name'),
                                subtitle: Text(user['username']),
                                leading: Icon(Icons.person),
                                tileColor: Colors.white,
                              ),
                            ),

                            SizedBox(height: 15,),

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0,5),
                                        color: Colors.deepOrange.withOpacity(.2),
                                        spreadRadius: 2,
                                        blurRadius: 10

                                    )
                                  ]
                              ),
                              child: ListTile(
                                title: Text('Email'),
                                subtitle: Text(user['email']),
                                leading: Icon(Icons.email),
                                tileColor: Colors.white,
                              ),
                            ),

                            SizedBox(height: 15,),

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0,5),
                                        color: Colors.deepOrange.withOpacity(.2),
                                        spreadRadius: 2,
                                        blurRadius: 10

                                    )
                                  ]
                              ),
                              child: ListTile(
                                title: Text('Number'),
                                subtitle: Text(user['number']),
                                leading: Icon(Icons.phone),
                                tileColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15,),


                            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                              stream: getDataDetails(),

                              builder: (context,snapshot) {

                                if(snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                else if(snapshot.hasError){
                                  return Text('Error: ${snapshot.error}');
                                }
                                else if(snapshot.hasData){
                                  Map<String,dynamic>? user = snapshot.data!.data();
                                  return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [


                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0,5),
                                                      color: Colors.deepOrange.withOpacity(.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 10

                                                  )
                                                ]
                                            ),
                                            child: ListTile(
                                              title: Text('Gender'),
                                              subtitle: Text(user!['gender']),
                                              leading: Icon(Icons.transgender),
                                              tileColor: Colors.white,
                                            ),
                                          ),

                                          SizedBox(height: 15,),

                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0,5),
                                                      color: Colors.deepOrange.withOpacity(.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 10

                                                  )
                                                ]
                                            ),
                                            child: ListTile(
                                              title: Text('BirthDate'),
                                              subtitle: Text(user['birthdate']),
                                              leading: Icon(Icons.date_range),
                                              tileColor: Colors.white,
                                            ),
                                          ),

                                          SizedBox(height: 15,),

                                        ],
                                  );

                                }
                                else
                                {
                                  return Text("No Data");
                                }

                              },
                            ),


                            ListTile(
                              title: Text('Settings',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0,5),
                                        color: Colors.deepOrange.withOpacity(.2),
                                        spreadRadius: 2,
                                        blurRadius: 10

                                    )
                                  ]
                              ),

                              child: ListTile(
                                  leading: Icon(
                                    Icons.settings,
                                    color: Colors.black,
                                  ),
                                  title: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Setting_page(),));
                                    },
                                    child:
                                    Text("Settings", style: TextStyle(color: Colors.black)),
                                  )),
                            ),

                            SizedBox(height: 15,),

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0,5),
                                        color: Colors.deepOrange.withOpacity(.2),
                                        spreadRadius: 2,
                                        blurRadius: 10

                                    )
                                  ]
                              ),

                              child: ListTile(
                                  leading: Icon(
                                    Icons.info,
                                    color: Colors.black,
                                  ),
                                  title: GestureDetector(
                                    onTap: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AboutUsPage()),
                                      );
                                    },
                                    child:
                                    Text("AboutUs", style: TextStyle(color: Colors.black)),
                                  )),
                            ),



                            SizedBox(height: 15,),

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0,5),
                                        color: Colors.deepOrange.withOpacity(.2),
                                        spreadRadius: 2,
                                        blurRadius: 10

                                    )
                                  ]
                              ),

                              child: ListTile(
                                  leading: Icon(
                                    Icons.logout,
                                    color: Colors.black,
                                  ),
                                  title: GestureDetector(
                                    onTap: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login_page()));
                                    },
                                    child:
                                    Text("Logout", style: TextStyle(color: Colors.red)),
                                  )),

                            ),



                          ],
                        ),
                      ),
                    );

                  }
                  else
                  {
                    return Text("No Data");
                  }
                },
              ),
            ],
          ),
        ),
      ),

    );

  }

}
