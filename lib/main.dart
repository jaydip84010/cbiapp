import 'dart:async';

import 'package:cbiapp/brp_screen.dart';
import 'package:cbiapp/demo.dart';
import 'package:cbiapp/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 320,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.35,
                  height: 75,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
  }
}
