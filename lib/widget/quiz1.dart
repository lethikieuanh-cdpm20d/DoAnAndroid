import 'package:flutter/material.dart';
import 'constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.indexAction,
    required this.question,
    required this.totalQuestion,
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Quetion ${indexAction + 1} / $totalQuestion: $question',
        style: const TextStyle(
          color: neutral,
          fontSize: 24,
        ),
      ),
    );
  }
}
