import 'package:basic1/quiz.dart';
import 'package:basic1/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final data = [
    {
      'question': "Choose one!",
      'answers': [
        {'name': 'No', 'score': 1},
        {'name': 'Yes', 'score': 2},
        {'name': 'Ambigu', 'score': 3},
        {'name': 'Not ye', 'score': 4},
      ],
    },
    {
      'question': "Choose one!",
      'answers': [
        {'name': 'No', 'score': 1},
        {'name': 'Yes', 'score': 2},
        {'name': 'Ambigu', 'score': 3},
        {'name': 'Not ye', 'score': 4},
      ],
    },
    {
      'question': "Choose one!",
      'answers': [
        {'name': 'No', 'score': 1},
        {'name': 'Yes', 'score': 2},
        {'name': 'Ambigu', 'score': 3},
        {'name': 'Not ye', 'score': 4},
      ],
    },
  ];
  int indexQuestion = 0;
  int totalScore = 0;
  void addScore(int score) {
    setState(() {
      indexQuestion++;
      totalScore += score;
    });
  }

  void reset() {
    setState(() {
      indexQuestion = 0;
      totalScore = 0;
    });
  }

  Widget showQuiz() {
    return (indexQuestion < data.length)
        ? Quiz(data[indexQuestion], this.addScore)
        : Result(totalScore, reset);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzy"),
        ),
        body: showQuiz(),
      ),
    );
  }
}
