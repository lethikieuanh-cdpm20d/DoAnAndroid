import 'dart:async';

import 'package:flutter/material.dart';

class Cau1 {
  var images = ["dovui", "healthy", "music", "tv"];
  var quetions = [
    ['Đội bóng Junventus được mệnh danh là gì?'],
    [
      'Kích thước sân bóng đá 11 người theo chuẩn được FIFA công nhận là bao nhiêu?'
    ],
  ];
  var choices = [
    [
      "Bà đầm già thành Turin",
      "ông già thành Turin",
      "Kền kền trắng",
      "Quỷ đỏ"
    ],
    ['52m x 120m', '45m x 90m', '48m x 97m', '40m x 87m'],
  ];
  var correctAnswers = [
    ["Bà đầm già thành Turin"],
    ['45m x 90m'],
  ];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = Cau1();

class QuizDifficult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizDifficultState();
  }
}

class QuizDifficultState extends State<QuizDifficult> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Câu ${questionNumber + 1}',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Điểm: $finalScore',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Container(
                      child: OtpTimer(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Image.asset(
                'images/${quiz.images[questionNumber]}.png',
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                quiz.quetions[questionNumber].toString(),
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),

              //cau tra loi
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //nut 1
                  MaterialButton(
                    height: 50,
                    minWidth: 120,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint('Correct');
                        finalScore++;
                      } else {
                        debugPrint('Wrong');
                      }
                      if (questionNumber == quiz.quetions.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(
                              score: finalScore,
                            ),
                          ),
                        );
                      } else {
                        questionNumber++;
                      }
                    },
                    child: Text(
                      quiz.choices[questionNumber][0],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //nut 2
                  MaterialButton(
                    height: 50,
                    minWidth: 120,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][1] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint('Correct');
                        finalScore++;
                      } else {
                        debugPrint('Wrong');
                      }
                      if (questionNumber == quiz.quetions.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(
                              score: finalScore,
                            ),
                          ),
                        );
                      } else {
                        questionNumber++;
                      }
                    },
                    child: Text(
                      quiz.choices[questionNumber][1],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //nut 3
                  MaterialButton(
                    height: 50,
                    minWidth: 120,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][2] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint('Correct');
                        finalScore++;
                      } else {
                        debugPrint('Wrong');
                      }
                      if (questionNumber == quiz.quetions.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(
                              score: finalScore,
                            ),
                          ),
                        );
                      } else {
                        questionNumber++;
                      }
                    },
                    child: Text(
                      quiz.choices[questionNumber][2],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //nut 4
                  MaterialButton(
                    height: 50,
                    minWidth: 120,
                    color: Colors.blueGrey,
                    onPressed: () {
                      if (quiz.choices[questionNumber][3] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint('Correct');
                        finalScore++;
                      } else {
                        debugPrint('Wrong');
                      }
                      if (questionNumber == quiz.quetions.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Summary(
                              score: finalScore,
                            ),
                          ),
                        );
                      } else {
                        questionNumber++;
                      }
                    },
                    child: Text(
                      quiz.choices[questionNumber][3],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  minWidth: 24,
                  height: 30,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                    finalScore = 0;
                    questionNumber = 0;
                  },
                  child: Text(
                    'Quit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

class Summary extends StatelessWidget {
  final int? score;
  Summary({Key? key, @required this.score}) : super(key: key);
  //const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tổng điểm: $score",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: const Text(
                  'Reset Quiz',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

//timer
class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 20;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.timer),
        SizedBox(
          width: 5,
        ),
        Text(timerText)
      ],
    );
  }
}
