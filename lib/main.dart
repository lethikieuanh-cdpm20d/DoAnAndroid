import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/homepage.dart';

import 'package:flutter_application_1/start.dart';

void main() async {
  // var db = DBconnect();
  // db.addQuestionMedium(Question(id: '1', title: '2/2=?', options: {
  //   '1': true,
  //   '12': false,
  //   '13': false,
  //   '14': false,
  // }));
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
    );
  }
}
