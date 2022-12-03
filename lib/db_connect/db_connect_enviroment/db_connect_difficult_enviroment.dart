import 'package:flutter_application_1/widget/question_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DBconnectDifficultEnviroment {
  final url = Uri.parse(
      'https://tracnghiemapp-d86b1-default-rtdb.firebaseio.com/questionsdifficultenviroment.json');
  // Future<void> addQuestions(Question question) async {
  //   http.post(url,
  //       body: json.encode({
  //         'title': question.title,
  //         'options': question.options,
  //       }));
  // }

  Future<List<Question>> fedchQuestions() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach(((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
        );
        newQuestions.add(newQuestion);
      }));
      return newQuestions;
    });
  }
}
