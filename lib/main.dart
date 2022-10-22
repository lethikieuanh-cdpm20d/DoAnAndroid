import 'package:flutter/material.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/start.dart';
import 'package:flutter_application_1/login.dart';


void main() => runApp(DoanApp());

class DoanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartApp(),
    );
  }
}

