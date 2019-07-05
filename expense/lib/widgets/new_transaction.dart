import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime _selectedDate;

  void _onSubmitted() {
    final title = _titleInputController.text;
    final amount = double.parse(_amountInputController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate== null) return;
    widget.addTx(
      title,
      amount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleInputController,
              onSubmitted: (_) => _onSubmitted(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountInputController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmitted(),
            ),
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Text(_selectedDate == null
                      ? 'No date choosed.'
                      : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                  FlatButton(
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            // Row
            RaisedButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: _onSubmitted,
            )
          ],
        ),
      ),
    );
  }
}
