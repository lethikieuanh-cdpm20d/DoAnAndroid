import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 17, 224, 93),
        ),
        body: Center(
            child: TextButton(
          onPressed: () {
            
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Image.asset('images/login.png'),
        )),
      ),
    );
  }
}
