import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 224, 93),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(246, 250, 250, 253),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Image.asset('images/login.png'),
          )),
    );
  }
}
