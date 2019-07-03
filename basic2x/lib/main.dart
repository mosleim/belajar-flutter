import 'package:basic2x/quiz.dart';
import 'package:basic2x/result.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _quiz = const [
    {
      'question': 'what is your favorite?',
      'answers': [
        {'name': 'red', 'score': 12},
        {'name': 'blue', 'score': 10},
        {'name': 'yellow', 'score': 12},
      ]
    },
    {
      'question': 'what is your favorite?',
      'answers': [
        {'name': 'red', 'score': 12},
        {'name': 'blue', 'score': 10},
        {'name': 'yellow', 'score': 12},
      ]
    },
    {
      'question': 'what is your favorite?',
      'answers': [
        {'name': 'red', 'score': 12},
        {'name': 'blue', 'score': 10},
        {'name': 'yellow', 'score': 12},
      ]
    }
  ];
  int _totalScore = 0;
  int _indexQuiz = 0;

  void _addScore(int score) {
    setState(() {
      _totalScore += score;
      _indexQuiz++;
    });
  }

  void _resetScore() {
    setState(() {
      _totalScore = 0;
      _indexQuiz = 0;
    });
  }

  Widget _showQuiz() {
    if (_indexQuiz < _quiz.length)
      return Quiz(
        quiz: _quiz[_indexQuiz],
        addScore: _addScore,
      );

    return Result(_totalScore, _resetScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Easy App"),
        ),
        body: _showQuiz(),
      ),
    );
  }
}
