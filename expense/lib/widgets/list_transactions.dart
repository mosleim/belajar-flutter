import 'package:expense/widgets/transaction_widget.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class ListTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) deleteTransaction;
  ListTransactions(this.transactions, this.deleteTransaction);

  Widget showTransaction(BuildContext c, int index) {
    return TransactionWidget(transactions[index], deleteTransaction);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 10,),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: showTransaction,
                itemCount: transactions.length,
              ));
  }
}
