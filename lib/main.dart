import 'package:delisol/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Delisol());
}

 class Delisol extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SplashScreen(),
     );
   }
 }

