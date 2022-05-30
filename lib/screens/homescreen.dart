// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homepage";

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
        final username = routeargs['username'];
        // final password = routeargs['password'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(child: Text('$username')),
    );
  }
}
