import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction trx;
  final Function(String) deleteTrx;
  TransactionWidget(this.trx, this.deleteTrx);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                NumberFormat.compactCurrency(
                  decimalDigits: 1,
                  symbol: '',
                  locale: 'id_ID'
                ).format(trx.amount), // '\$${trx.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          trx.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(trx.date),
          style: Theme.of(context).textTheme.subtitle,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTrx(trx.id),
        ),
      ),
    );
  }
}
