import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import '../category_list/category.dart';
import 'constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: background,
        content: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Điểm',
                style: TextStyle(
                  color: neutral,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                child: Text(
                  '$result/$questionLength',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                radius: 70,
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength / 2
                        ? inCorrect
                        : Correct,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                result == questionLength / 2
                    ? 'Hay lắm bạn ơi!'
                    : result < questionLength / 2
                        ? 'Chơi lại ?'
                        : 'Tuyệt Vời',
                style: const TextStyle(
                  color: neutral,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: onPressed,
                child: const Text(
                  'Chơi lại',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homepageScreeen(),
                    ),
                  );
                },
                child: const Text(
                  'Thoát',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
