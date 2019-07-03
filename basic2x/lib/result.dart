import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetScore;
  Result(this.score, this.resetScore);
  String get _showScore {
    if (score < 12) {
      return "You are Ugly!";
    } else if (score < 20) {
      return "you are not Ugly!";
    }
    return "You are the Smarter!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(_showScore),
          RaisedButton(
            child: Text(
              "Test Again",
            ),
            onPressed: resetScore,
          ),
        ],
      ),
    );
  }
}
