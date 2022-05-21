// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_news/auth/google_sign_in.dart';
// import 'package:flutter_news/screens/first_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_core/firebase_core.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final formkey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   String email = '';
//   String password = '';
//   bool isloading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isloading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Form(
//               key: formkey,
//               child: AnnotatedRegion<SystemUiOverlayStyle>(
//                 value: SystemUiOverlayStyle.light,
//                 child: Stack(
//                   children: [
//                     Container(
//                       height: double.infinity,
//                       width: double.infinity,
//                       color: Colors.grey[200],
//                       child: SingleChildScrollView(
//                         padding:
//                            const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                           const  Text(
//                               "Sign In",
//                               style: TextStyle(
//                                   fontSize: 50,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           const  SizedBox(height: 30),
//                             TextFormField(
//                               keyboardType: TextInputType.emailAddress,
//                               onChanged: (value) {
//                                 email = value;
//                               },
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Please enter Email";
//                                 }
//                               },
//                               textAlign: TextAlign.center,
//                             ),
//                           const  SizedBox(height: 30),
//                             TextFormField(
//                               obscureText: true,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Please enter Password";
//                                 }
//                               },
//                               onChanged: (value) {
//                                 password = value;
//                               },
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 80),
//                             SizedBox(height: 30),
//                             _signInButton(),
//                             GestureDetector(
//                               onTap: () {
//                                 // Navigator.of(context).push(
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => SignupScreen(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Don't have an Account ?",
//                                     style: TextStyle(
//                                         fontSize: 20, color: Colors.black87),
//                                   ),
//                                   SizedBox(width: 10),
//                                   Text(
//                                     'Sign ',
//                                     style: TextStyle(
//                                         fontSize: 21,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _signInButton() {
//     return ElevatedButton(
//       // splashColor: Colors.grey,
//       onPressed: () {
//         signInWithGoogle().then((result) {
//           if (result != null) {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return FirstScreen();
//                 },
//               ),
//             );
//           } else
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return LoginScreen();
//                 },
//               ),
//             );
//         });
//       },
//       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//       // highlightElevation: 0,
//       // borderSide: BorderSide(color: Colors.grey),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             // Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
//             Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.grey,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
