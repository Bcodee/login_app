import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/screens/loginscreen1.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatefulWidget {
  static const routeName = "/registerscreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  bool isHiddenPassword = true;
  //define global key

  // To Register
  void register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: cEmail.text, password: cPassword.text);

      Navigator.of(context).pushReplacementNamed(LoginScreen1.routename);
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

  //define global key
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // color: Color(0xff9a8c98),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://wallpapers.com/images/high/aesthetic-gradient-art-q3krubf2oiscd23t.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      'Register',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: GoogleFonts.lobster().fontFamily,
                          color: const Color(0xff9b2226)),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color(
                        0xffbc6c25,
                      ),
                      height: 3,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          const SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: cEmail,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please Enter Email";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xff283618)),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                                hintText: 'Enter Email',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: cPassword,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Enter Password";
                                }
                                if (val.length < 6) {
                                  return "Password length must be more than 6";
                                }
                                return null;
                              },
                              obscureText: isHiddenPassword,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xff283618)),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 17),
                                hintText: 'Enter Password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: InkWell(
                                  child: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                  onTap: _tooglePassView,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please Enter Password";
                                }
                                if (cPassword.text != val) {
                                  return 'Password Mismatch';
                                }
                                return null;
                              },
                              obscureText: isHiddenPassword,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      width: 3, color: Color(0xff283618)),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17),
                                hintText: 'Confirm Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                          ),
                          //TODO: Confirm Password
                          const SizedBox(
                            height: 30,
                          ),
                          OutlinedButton(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(150, 40),
                              primary: Colors.white,
                              backgroundColor: const Color(0xff044748),
                              shadowColor: Colors.yellow,
                              elevation: 10,
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                register();
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LoginScreen1.routename);
                            },
                            child: const Text(
                              'Already have account? Click here',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
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
