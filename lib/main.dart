import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/rank.dart';
import 'package:flutter_application_1/start.dart';


void main() => runApp(DoanApp());

class DoanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  StartApp(),
    );
  }
}
