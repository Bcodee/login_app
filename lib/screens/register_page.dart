import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/models/user.dart';
import 'package:loginapp/screens/loginscreen1.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatefulWidget {
  static const routeName = "/registerscreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController cPasswordCtrl = TextEditingController();
  TextEditingController cUsernameCtrl = TextEditingController();
  TextEditingController cEmailCtrl = TextEditingController();
  bool isHiddenPassword = true;
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
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "please enter Username";
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
                                fillColor: Colors.red,
                                hintText: 'Enter User ID',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
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
                              controller: cPasswordCtrl,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Enter Password";
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
                                if (cPasswordCtrl.text != val) {
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
                                User u = User(cUsernameCtrl.text,
                                    cEmailCtrl.text, cPasswordCtrl.text);
                                allUsers.add(u);
                                Fluttertoast.showToast(
                                    msg: 'User Created Successfully');
                                Navigator.pop(context);
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ))
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
