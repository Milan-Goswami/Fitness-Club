

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Home_Bar/Person_Page/Setting_page.dart';


import 'package:flutter/material.dart';

class change_number extends StatelessWidget {
   change_number({super.key});

   final User? currentUser = FirebaseAuth.instance.currentUser;

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   Future<DocumentSnapshot<Map<String, dynamic>>>getUserDetails()async{
     return await FirebaseFirestore.instance
         .collection("Users")
         .doc(currentUser!.email)
         .get();
   }

  TextEditingController _usercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
              padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(60),
                        child: Center(child: Image.asset('assets/image/Login.gif')),
                      ),

                      Text('Change Phone Number',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),


                      SizedBox(height: 30,),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _usercontroller,
                          keyboardType: TextInputType.phone,
                           decoration: InputDecoration(
                             label: Text('Number'),
                             hintText: 'Enter Number',
                             prefixIcon: Icon(Icons.phone),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10)),
                           ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a number';
                            }  else if (value.length < 10) {
                              return 'Please enter a valid 10 number ';
                            }
                            else if (value.length > 10) {
                              return 'Please enter a valid only 10 number';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 30,),

                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: GestureDetector(
                            onTap: ()async{
                              if (_formkey.currentState!.validate()) {
                                await FirebaseFirestore.instance.collection(
                                    'Users')
                                    .doc(currentUser?.email.toString())
                                    .update({
                                  'number': _usercontroller.text
                                });

                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (
                                    context) => Setting_page(),));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
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
            )
    );
  }
}
