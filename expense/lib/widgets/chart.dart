import 'package:expense/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (var trx in recentTransactions) {
        if (trx.date.day == weekDay.day &&
            trx.date.month == weekDay.month &&
            trx.date.year == weekDay.year) {
          totalSum += trx.amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get _total {
    return groupedTransactionValues.fold(0.0, (sum, el) {
      return sum + el['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((el) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: el['day'],
                spendingAmount: el['amount'],
                spendingPctOfTotal:
                    _total == 0.0 ? 0.0 : (el['amount'] as double) / _total,
              ),
            );
          }).toList().reversed.toList(),
        ),
      ),
    );
  }
}
