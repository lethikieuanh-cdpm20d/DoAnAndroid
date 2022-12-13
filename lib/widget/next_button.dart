import 'package:flutter/material.dart';
import 'constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        'Câu hỏi tiếp theo ',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
