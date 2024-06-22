// ignore_for_file: prefer_const_constructors

import 'package:agecalculaltor/home_page.dart';
import 'package:agecalculaltor/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  const AgeCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => HomePage(),
      },
      
    );
  }
}