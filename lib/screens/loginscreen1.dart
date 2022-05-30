// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  //example user name and password
  // String username = 'Admin';
  // String password = 'Test123';

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
                          controller: cUsername,
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
                            hintText: 'Enter Username',
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
                          if (allUsers.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "No user Found");
                            return;
                          }
                          if (cUsername.text.isNotEmpty &&
                              cPassword.text.isNotEmpty) { 
                            allUsers.forEach((user) {
                              String username = user.name;
                              String password = user.password;
                              if (cUsername.text == username && 
                                  cPassword.text == password) {
                                Navigator.popAndPushNamed(
                                    context, HomeScreen.routeName, arguments: {
                                  'username': cUsername.text,
                                  'password': cPassword.text
                                });
                                Fluttertoast.showToast(
                                    msg: 'Successfully login');
                                return;
                              }
                            });
                            Fluttertoast.showToast(
                                msg: "Invalid Username or Password");
                          } else {
                            Fluttertoast.showToast(
                                msg: "Invalid Username or Password");
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
                            text: "Sign up with Google",
                            onPressed: () {},
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
