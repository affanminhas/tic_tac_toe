import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/app_dashboard.dart';
import 'package:tic_tac_toe/screens/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kati Zero",
      home: SplashScreen(),
    );
  }
}


