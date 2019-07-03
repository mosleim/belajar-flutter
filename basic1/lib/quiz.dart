import 'package:basic1/answer.dart';
import 'package:basic1/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final Map<String, Object> quiz;
  final Function(int) addScoore;
  Quiz(this.quiz, this.addScoore);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(quiz['question']),
        Answer(quiz['answers'], addScoore)
      ],
    );
  }
}
