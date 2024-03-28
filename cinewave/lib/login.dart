import 'package:flutter/material.dart';
import 'appbar.dart';
import 'appbarbottom.dart';

class LoginPagetest extends StatelessWidget {
  const LoginPagetest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please enter your login credentials:',
            ),
            // Add TextFormFields and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}