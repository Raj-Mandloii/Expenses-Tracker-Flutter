import "../models/transactions.dart";
import "../widgets/chart_bar.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);
  final List<Transactions> recentTransactions;
  const Chart({required this.recentTransactions});
  //<Map<String, Object>>
  List get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    //this is equal to reduce function in javascript.
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map((el) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                el["day"],
                el["amount"],
                maxSpending == 0.0 ? 0.0 : el['amount'] / maxSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
