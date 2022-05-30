import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/screens/homescreen.dart';
import 'package:loginapp/screens/register_page.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  static const routeName = "/loginscreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cUsername,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 0.8, color: Colors.green),
                  ),
                  hintText: 'Enter Username',
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cPassword,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 0.8, color: Colors.green),
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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (cUsername.text.isNotEmpty && cPassword.text.isNotEmpty) {
                  Navigator.popAndPushNamed(context, HomeScreen.routeName);
                } else {
                  Fluttertoast.showToast(msg: "Enter Username or Password");
                }
              },
              icon: const Icon(Icons.login),
              label: const Text('Login'),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                primary: Colors.purpleAccent,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              icon: const Icon(Icons.add),
              label: const Text('Register'),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                primary: Colors.black,
                minimumSize: const Size(200, 50),
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Forget Password'))
          ],
        ),
      ),
    );
  }

  void _tooglePassView() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
