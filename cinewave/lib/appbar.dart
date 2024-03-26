import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar()
      : super(
          title: Center(
            child: Image.asset('lib/assets/images/C.png', fit: BoxFit.contain, height: 40,),
          ),
          backgroundColor: const Color(0xFF002B53),
        );
}