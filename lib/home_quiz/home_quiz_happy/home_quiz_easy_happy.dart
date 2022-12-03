import 'package:flutter/material.dart';
import 'package:flutter_application_1/db_connect/db_connect_happy/db_connect_easy_happy.dart';
import '../../widget/question_model.dart';
import '../../widget/constants.dart';
import '../../widget/next_button.dart';
import '../../widget/quiz1.dart';
import '../../widget/options_card.dart';
import '../../widget/result_box.dart';

class QuizEasyHappy extends StatefulWidget {
  const QuizEasyHappy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizEasyState();
  }
}

class _QuizEasyState extends State<QuizEasyHappy> {
  var db = DBconnectEasyHappy();

  late Future _question;

  Future<List<Question>> getData() async {
    return db.fedchQuestions();
  }

  @override
  void initState() {
    _question = getData();
    super.initState();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

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
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Xin Hãy chọn câu trả lời !!'),
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
                      'Score: $score',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
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
