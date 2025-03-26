

import 'package:fitness_club/Home_Bar/Person_Page/Change_phone.dart';
import 'package:fitness_club/Page/ForgetPassword.dart';
import 'package:flutter/material.dart';

class Setting_page extends StatelessWidget {
  const Setting_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
         backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                  leading: Icon(
                    Icons.fingerprint,
                    color: Colors.black,
                  ),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Forgetpass(),));
                    },
                    child:
                    Text("Change Password", style: TextStyle(color: Colors.black)),
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
                    Icons.phone,
                    color: Colors.black,
                  ),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => change_number(),));
                    },
                    child:
                    Text("Change Number", style: TextStyle(color: Colors.black)),
                  )),
            ),


          ],
        ),
      ),
    );
  }
}
