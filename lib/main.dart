import 'package:flutter/material.dart';
import 'package:flutter_app_msu2/views/home_ui.dart';
import 'package:flutter_app_msu2/views/splash_screen_ui.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Colors.yellow,
      ),
    ),
  );
}