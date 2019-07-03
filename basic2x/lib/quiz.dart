import 'package:basic2x/answer.dart';
import 'package:basic2x/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final Map<String, Object> quiz;
  final Function(int) addScore;
  Quiz({@required this.quiz,  @required this.addScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Question(quiz['question']),
          Answer(quiz['answers'], addScore)
        ],
      ),
    );
  }
}
