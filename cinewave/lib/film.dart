import 'package:flutter/material.dart';
import 'appbar.dart';
import 'appbarbottom.dart';

class FilmPage extends StatelessWidget {
  const FilmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'film',
            ),
            // Add TextFormFields and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}