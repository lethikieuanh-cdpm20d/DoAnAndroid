import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_quiz/home_quiz_environment/home_quiz_difficult_enviroment.dart';
import 'package:flutter_application_1/home_quiz/home_quiz_environment/home_quiz_enviroment.dart';
import 'package:flutter_application_1/home_quiz/home_quiz_environment/home_quiz_medium_enviroment.dart';

class categoryRegimeScrennEnviroment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 224, 93),
        centerTitle: true,
        title: const Text(
          'Độ khó',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 248, 244, 244),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizEasyEnviroment(),
                    ));
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 17, 224, 93),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Color.fromARGB(255, 206, 199, 199),
                foregroundColor: Colors.red,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                  ),
                  const Text(
                    'Dễ',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizMediumEnviroment(),
                    ));
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 17, 224, 93),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: const Color.fromARGB(255, 206, 199, 199),
                foregroundColor: Colors.red,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                  ),
                  const Text(
                    'Trung Bình',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizDifficultEnviroment(),
                    ));
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 17, 224, 93),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Color.fromARGB(255, 206, 199, 199),
                foregroundColor: Colors.red,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                  ),
                  const Text(
                    'Khó',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
