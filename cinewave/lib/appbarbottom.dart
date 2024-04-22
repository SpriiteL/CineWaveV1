import 'package:flutter/material.dart';
import 'package:cinewave/film.dart';
import 'package:cinewave/main.dart';
import 'appbar.dart';
import 'screens/login_page.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Scaffold(
      appBar: MyAppBar(),
      body: const MainBody(),
    ),
    Scaffold(
      appBar: MyAppBar(),
      body: const FilmPage(),
    ),
    Scaffold(
      appBar: MyAppBar(),
      body: LoginPage(),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Autres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Connexion',
          ),
        ],
        backgroundColor: const Color(0xFF002B53),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
