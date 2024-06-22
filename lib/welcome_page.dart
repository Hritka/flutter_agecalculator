// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 10, 17, 23), Color.fromARGB(255, 78, 119, 176)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: Image.asset(
                  'lib/background.png',
                  width: 300,
                ),
              ),
              SizedBox(height: 100),
              Text(
                "How Old Am I?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Check your current age based on DOB",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                 },
                child:  Icon(
                Icons.arrow_circle_right,
                size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
