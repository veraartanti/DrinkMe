import 'package:drinkme/view/login/login.dart';
import 'package:drinkme/view/splash/splashscreen.dart';
import 'package:flutter/material.dart';

import 'view/favorite/favorite.dart';
import 'view/home/home.dart';
import 'view/profile/profile.dart';

import 'navigator/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
