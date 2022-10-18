import 'package:flutter/material.dart';
import 'package:flutter_application_1/start.dart';
import 'package:flutter_application_1/login.dart';

//import 'login.dart';

void main() => runApp(DoanApp());

class DoanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartApp(),
    );
  }
}
