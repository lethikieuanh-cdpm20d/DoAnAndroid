import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/homepage.dart';

import 'package:flutter_application_1/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DoanApp());
}

class DoanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute:
          FirebaseAuth.instance.currentUser == 'null' ? 'home' : 'welcome',
      routes: {
        'welcome': (context) => StartApp(),
        'home': (context) => homepageScreeen(),
      },
      home: StartApp(),
    );
  }
}
