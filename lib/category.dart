import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class categoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          TextButton(
              onPressed: () {},
              child: Image.asset(
                'images/quizz1.png',
                width: 500,
                height: 100,
                fit: BoxFit.fill,
                
              )),
        ]),
      ),
    );
  }
}
