// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/screens/homescreen.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:loginapp/screens/register_page.dart';

class LoginScreen1 extends StatefulWidget {
  static const routename = '/loginscreen1';

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  bool isHiddenPassword = true;
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  //example user name and password
  // String username = 'Admin';
  // String password = 'Test123';
  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: cEmail.text, password: cPassword.text);
      Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  //signIn with google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557683304-673a23048d34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=282&q=80'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage('assets/flower.png'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 450,
                width: 360,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1604077137850-c6d2e2a44cce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   'Welcome',
                      //   style: TextStyle(
                      //       fontSize: 40,
                      //       fontWeight: FontWeight.w900,
                      //       fontFamily: GoogleFonts.aBeeZee().fontFamily,
                      //       color: Colors.red),
                      // ),
                      const SizedBox(
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          controller: cEmail,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 17),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(
                                  width: 0.8, color: Colors.green),
                            ),
                            hintText: 'Enter Email',
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          controller: cPassword,
                          obscureText: isHiddenPassword,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 17),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35.0),
                              borderSide: const BorderSide(
                                  width: 0.8, color: Colors.green),
                            ),
                            hintText: 'Enter Password',
                            suffixIcon: InkWell(
                              onTap: _tooglePassView,
                              child: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.amber,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (cEmail.text.isNotEmpty &&
                              cPassword.text.isNotEmpty) {
                            login();
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Please enter email and password');
                          }
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Color(0xfffca311)),
                            primary: const Color(0xff2a9d8f),
                            minimumSize: const Size(200, 50),
                            onSurface: Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, RegisterScreen.routeName);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Register'),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Colors.black),
                          primary: Colors.black,
                          minimumSize: const Size(200, 50),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignInButton(
                            Buttons.Facebook,
                            text: "Sign in with Facebook",
                            onPressed: () {},
                          ),
                          SignInButton(
                            Buttons.Google,
                            text: "Sign in with Google",
                            onPressed: () {
                              signInWithGoogle();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Forget Password?'))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tooglePassView() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
      const Icon(
        Icons.remove_red_eye,
        color: Colors.black,
      );
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
