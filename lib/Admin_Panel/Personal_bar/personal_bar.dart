
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:fitness_club/Page/ForgetPassword.dart';
import 'package:flutter/material.dart';

class personal_bar extends StatelessWidget {
   personal_bar({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>>getUserDetails()async{
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
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
            return Padding(
              padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Admin',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 24),)
                      ],
                    ),

                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/image/pic.png'),
                    ),

                    Text(user!['name'],style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold ),),

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
                        subtitle: Text(user!['name']),
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
                        subtitle: Text(user!['email']),
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
                        title: Text('Password'),
                        subtitle: Text(user!['pass']),
                        leading: Icon(Icons.password),
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
    );
  }
}
