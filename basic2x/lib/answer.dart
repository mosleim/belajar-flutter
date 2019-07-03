import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function(int) addScore;
  final List<Map<String, Object>> answers;
  Answer(this.answers, this.addScore);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers
          .map(
            (el) => Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text(el['name'], style: TextStyle(color: Colors.white),),
                    onPressed: () => addScore(el['score']),
                    color: Colors.blue,
                  ),
                ),
          )
          .toList(),
    );
  }
}
