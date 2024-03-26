import 'package:flutter/material.dart';
import 'appbar.dart';
import 'appbarbottom.dart'; // Assurez-vous que le chemin d'importation est correct

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(), // Utilisez MyAppBar ici
        body: const Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: BottomBar(), // Utilisez BottomBar ici
      ),
    );
  }
}