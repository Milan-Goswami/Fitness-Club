import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final _auth = FirebaseAuth.instance;

  TextEditingController _emailcontroller = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset('assets/image/login.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                  child: Text(
                "Forget Password",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigoAccent),
              )),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                  child: Text(
                      "send the email your email id and click the link new password add.",
                  style:  TextStyle(fontWeight: FontWeight.normal,fontSize: 12),)),
            ),

            SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: _validateEmail),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_emailcontroller != null) {
                  _auth
                      .sendPasswordResetEmail(
                          email: _emailcontroller.text.toString())
                      .then((value) {
                    Fluttertoast.showToast(
                        msg:
                            'We have sent you email to recover password,please check email..!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16,
                        webPosition: 'center');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login_page()));
                  }).onError((error, stackTrace) {
                    Fluttertoast.showToast(
                        msg: 'Please enter valid email id..!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16,
                        webPosition: 'center');
                    if (_formkey.currentState!.validate()) {}
                  });
                }
              },

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        "Submit",
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
      ),
    );
  }
}
