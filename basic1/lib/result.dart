import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int score;
  Result(this.score, this.reset);
  String get strScore {
    return (score < 5) ? "Ugly!" : "Smart!";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(strScore, style: TextStyle(fontSize: 34),),
            RaisedButton(
              child: Text("reset"),
              onPressed: reset,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
