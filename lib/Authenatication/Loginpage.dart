// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fitness_club/Admin_Panel/home_bar.dart';
// import 'package:fitness_club/Authenatication/Database.dart';
// import 'package:fitness_club/Page/ForgetPassword.dart';
// import 'package:fitness_club/Authenatication/SingUppage.dart';
// import 'package:fitness_club/Page/HomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class Login_page extends StatefulWidget {
//   const Login_page({super.key});
//
//   @override
//   State<Login_page> createState() => _Login_pageState();
// }
//
// class _Login_pageState extends State<Login_page> {
//
//   final FirebaseAuthService _auth = FirebaseAuthService();
//
//   TextEditingController _emailcontroller = TextEditingController();
//   TextEditingController _passwordcontroller = TextEditingController();
//
//   @override
//   void dispose(){
//
//     _emailcontroller.dispose();
//     _passwordcontroller.dispose();
//
//
//     super.dispose();
//   }
//
//   bool _isSecurepassword = true;
//
//   final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a password';
//     }
//     // Check for valid length between 6 and 15 characters
//     if (value.length < 6 || value.length > 15) {
//       return 'Password must be between 6 and 15 characters';
//     }
//
//     String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,15}$';
//     RegExp regex = RegExp(pattern);
//     if (!regex.hasMatch(value)) {
//       return 'Password must include at least one letter, one number, and one special character (@\$!%*#?&)';
//     }
//     return null;
//   }
//
//   String? _validateEmail(value){
//     if(value!.isEmpty){
//       return 'please enter an email';
//     }
//     RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if(!emailRegExp.hasMatch(value)){
//       return 'please enter a valid email';
//     }
//     return null;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(70),
//               child: Center(child: Image.asset('assets/image/Login.gif')),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 "Login",
//                 style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 controller: _emailcontroller,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                     labelText: 'Email',
//                     hintText: 'Enter email',
//                     prefixIcon: Icon(Icons.email),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12))
//                 ),
//                 validator: _validateEmail,
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: TextFormField(
//                 controller: _passwordcontroller,
//                 obscureText: _isSecurepassword,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                     labelText: 'Password',
//                     hintText: 'Enter password',
//                     prefixIcon: Icon(Icons.password),
//                     suffixIcon: togglepassword(),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12))
//                 ),
//                validator: validatePassword
//               ),
//             ),
//
//             const SizedBox(
//               height: 5,
//             ),
//
//             Padding(
//               padding:  const EdgeInsets.only(left: 237),
//               child: Row(
//                 children: [
//                   TextButton(onPressed: (){
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Forgetpass()));
//                   }
//                       , child:const Text(
//                         "Forget Password?",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                             fontSize: 15)
//                       ), ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: GestureDetector(
//                     onTap: _singin,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Center(
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(left: 90),
//               child: Row(
//                 children: [
//                   const Text("Dont have an account?"),
//                   TextButton(onPressed:() {
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SingUp_page()));
//                   }, child: const Text("SingUp",style: TextStyle(color: Colors.blue))),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     ));
//   }
//   Widget togglepassword(){
//     return IconButton(onPressed: (){
//       setState((){
//         _isSecurepassword  = !_isSecurepassword;
//       });
//     }, icon: _isSecurepassword ? const Icon( Icons.visibility):const Icon( Icons.visibility_off),color: Colors.grey,);
//   }
//
//   // void _singin() async {
//   //
//   //   String email = _emailcontroller.text;
//   //   String password = _passwordcontroller.text;
//   //
//   //   User? user = await _auth.singinwithEmailandPassword(email, password);
//   //
//   //   if( email == 'admin123@gmail.com' && password == '884984' ){
//   //     //pass884984
//   //     Fluttertoast.showToast(
//   //         msg: 'Successfully Admin..!',
//   //         toastLength: Toast.LENGTH_SHORT,
//   //         gravity: ToastGravity.BOTTOM,
//   //         timeInSecForIosWeb: 2,
//   //         backgroundColor: Colors.white,
//   //         textColor: Colors.black,
//   //         fontSize: 16,
//   //         webPosition: 'center');
//   //
//   //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home_bar()));
//   //
//   //
//   //   }else if (user != null) {
//   //     Fluttertoast.showToast(
//   //         msg: 'Successfully Login..!',
//   //         toastLength: Toast.LENGTH_SHORT,
//   //         gravity: ToastGravity.BOTTOM,
//   //         timeInSecForIosWeb: 2,
//   //         backgroundColor: Colors.white,
//   //         textColor: Colors.black,
//   //         fontSize: 16,
//   //         webPosition: 'center');
//   //
//   //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_page()));
//   //
//   //   }else {
//   //     if (_formKey.currentState!.validate()) {}
//   //     Fluttertoast.showToast(
//   //         msg: 'Please enter valid email&password...!',
//   //         toastLength: Toast.LENGTH_SHORT,
//   //         gravity: ToastGravity.BOTTOM,
//   //         timeInSecForIosWeb: 2,
//   //         backgroundColor: Colors.white,
//   //         textColor: Colors.black,
//   //         fontSize: 16,
//   //         webPosition: 'center');
//   //
//   //   }
//   // }
//
//
//
//   void _singin() async {
//     if (_formKey.currentState!.validate()) {
//       String email = _emailcontroller.text;
//       String password = _passwordcontroller.text;
//
//       // Sign in once for both admin and normal users.
//       User? user = await _auth.singinwithEmailandPassword(email, password);
//       if (user != null) {
//         if (email == 'admin123@gmail.com' && password == '884984') {
//           Fluttertoast.showToast(
//               msg: 'Successfully Admin..!',
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 2,
//               backgroundColor: Colors.white,
//               textColor: Colors.black,
//               fontSize: 16,
//               webPosition: 'center');
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => home_bar()));
//         } else {
//           Fluttertoast.showToast(
//               msg: 'Successfully Login..!',
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 2,
//               backgroundColor: Colors.white,
//               textColor: Colors.black,
//               fontSize: 16,
//               webPosition: 'center');
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Home_page()));
//         }
//       } else {
//         Fluttertoast.showToast(
//             msg: 'Please enter valid email & password...!',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 2,
//             backgroundColor: Colors.white,
//             textColor: Colors.black,
//             fontSize: 16,
//             webPosition: 'center');
//       }
//     }
//   }
//
//
//
// }













import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_club/Admin_Panel/home_bar.dart';
import 'package:fitness_club/Authenatication/Database.dart';
import 'package:fitness_club/Page/ForgetPassword.dart';
import 'package:fitness_club/Authenatication/SingUppage.dart';
import 'package:fitness_club/Page/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool _isSecurepassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Simplified validation: only checking if field is empty.
  String? simpleEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    return null;
  }

  String? simplePasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(70),
                child: Center(child: Image.asset('assets/image/Login.gif')),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: simpleEmailValidator,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _passwordcontroller,
                  obscureText: _isSecurepassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: togglePassword(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: simplePasswordValidator,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 237),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Forgetpass()));
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: _singin,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Login',
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
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingUp_page()));
                        },
                        child: const Text(
                          "SingUp",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurepassword = !_isSecurepassword;
        });
      },
      icon: _isSecurepassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }

  void _singin() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailcontroller.text;
      String password = _passwordcontroller.text;

      User? user = await _auth.singinwithEmailandPassword(email, password);
      if (user != null) {
        // Check if it's admin
        if (email == 'admin123@gmail.com' && password == '884984') {
          Fluttertoast.showToast(
              msg: 'Successfully Admin..!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16,
              webPosition: 'center');
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => home_bar()));
        } else {
          Fluttertoast.showToast(
              msg: 'Successfully Login..!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16,
              webPosition: 'center');
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Home_page()));
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Please enter valid email & password...!',
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
}
