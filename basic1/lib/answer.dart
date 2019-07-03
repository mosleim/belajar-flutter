import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function(int) addScore;
  final List<Map<String, Object>> answers;
  Answer(this.answers, this.addScore);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: answers
            .map((element) => RaisedButton(color: Colors.blue,
                  child: Text(element['name']),
                  onPressed: ()=>addScore(element['score']),
                ))
            .toList(),
      ),
    );
  }
}
