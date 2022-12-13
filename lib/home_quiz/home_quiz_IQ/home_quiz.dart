import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widget/question_model.dart';
import '../../widget/constants.dart';
import '../../widget/next_button.dart';
import '../../widget/quiz1.dart';
import '../../widget/options_card.dart';
import '../../widget/result_box.dart';
import '../../db_connect/db_connect_IQ/db_connect.dart';

class QuizEasy extends StatefulWidget {
  const QuizEasy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizEasyState();
  }
}

class _QuizEasyState extends State<QuizEasy> {
  var db = DBconnect();

  late Future _question;

  Future<List<Question>> getData() async {
    return db.fedchQuestions();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  @override
  void initState() {
    _question = getData();
    StarTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  int seconds = 20;
  Timer? timer;

  StarTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (seconds == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Thông Báo'),
                  content: Text('Mời bạn chọn câu hỏi vì đã hết giờ !!'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('ok'))
                  ],
                );
              });
        } else {
          timer.cancel();
        }
      });
    });
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
      timer!.cancel();
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
          timer!.cancel();
          seconds = 20;
          StarTimer();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Xin Hãy chọn câu trả lời !!',
              style: TextStyle(color: Colors.red),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
        );
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
      seconds = 20;
      StarTimer();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _question as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                title: const Text(
                  'CÂU HỎI',
                ),
                backgroundColor: backgroundAppBar,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'Điểm: $score',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '$seconds',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: seconds / 20,
                          valueColor: const AlwaysStoppedAnimation(Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    QuestionWidget(
                        indexAction: index,
                        question: extractedData[index].title,
                        totalQuestion: extractedData.length),
                    const Divider(
                      color: neutral,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? Correct
                                  : inCorrect
                              : neutral,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Vui Lòng Đợi 1 xíu !!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text('Không có dữ liệu!!'),
        );
      },
    );
  }
}
