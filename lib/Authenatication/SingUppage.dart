import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Authenatication/Database.dart';
import 'package:fitness_club/Authenatication/Loginpage.dart';
import 'package:fitness_club/OnBroadingPage/screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingUp_page extends StatefulWidget {
  const SingUp_page({super.key});

  @override
  State<SingUp_page> createState() => _SingUp_pageState();
}

class _SingUp_pageState extends State<SingUp_page> {

  final FirebaseAuthService _auth =FirebaseAuthService();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _usernamecontroller = TextEditingController();

  TextEditingController _contactcontroller = TextEditingController();

  void dispose(){

    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _contactcontroller.dispose();
    _usernamecontroller.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isSecurepassword = true;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // Check for valid length between 6 and 15 characters
    if (value.length < 6 || value.length > 15) {
      return 'Password must be between 6 and 15 characters';
    }

    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,15}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password is weak';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    // This regex requires at least one digit in the local part before the @.
    RegExp emailRegExp = RegExp(r'^(?=[\w.-]*\d)[\w.-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  // String? _validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return 'please enter an email';
  //   }
  //   RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   if (!emailRegExp.hasMatch(value)) {
  //     return 'please enter a valid email';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Image.asset("assets/image/sing.gif"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: _usernamecontroller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'UserName',
                              hintText: 'Enter user name',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                              controller: _emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: _validateEmail),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: _contactcontroller,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              hintText: 'Enter number',
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a number';
                              }  else if (value.length < 10) {
                                return 'Please enter a valid number';
                              }
                              else if (value.length > 10) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },

                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: _passwordcontroller,
                            obscureText: _isSecurepassword,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter password',
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: togglepassword(),
                            ),
                            validator: validatePassword
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: _singup,
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigoAccent,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(25),
                              child: Center(
                                child: Text(
                                  "SingUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Row(
                            children: [
                              Text("Have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login_page()));
                                  },
                                  child: Text("Login",
                                      style: TextStyle(color: Colors.blue))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget togglepassword(){
    return IconButton(onPressed: (){
      setState((){
        _isSecurepassword  = !_isSecurepassword;
      });
    }, icon: _isSecurepassword ? Icon( Icons.visibility):Icon( Icons.visibility_off),color: Colors.grey,);
  }

  void _singup() async {


    if (!_formkey.currentState!.validate()) {
      return; // Stop if the form is not valid
    }

    String username = _usernamecontroller.text;
    String email = _emailcontroller.text;
    String password = _passwordcontroller.text;
    username;

    User? user = await _auth.singupwithEmailandPassword(email, password);

    if (user != null) {
      if (_formkey.currentState!.validate()) {
        Fluttertoast.showToast(
            msg: 'Successfully Create Your Account..!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16,
            webPosition: 'center');

        //firestore database store the value
        await FirebaseFirestore.instance.collection('Users')
            .doc(user.email)
            .set({
          'email':user.email,
          'username':_usernamecontroller.text,
          'number':_contactcontroller.text,
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onbroading()));
      }

    }else{
      if (_formkey.currentState!.validate()) {}
      Fluttertoast.showToast(
          msg: 'Please enter a valid Email and Password!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16,
          webPosition: 'center');

    }
  }

}
