// import '../models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List userTransactions;
  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx,i) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                width: 120,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 1,
                )),
                padding: const EdgeInsets.all(10),
                child: Text(
                  '\$${userTransactions[i].amount}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userTransactions[i].title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat().format(userTransactions[i].date),
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              )
            ]),
          );
        },
        itemCount: userTransactions.length,
        // children: userTransactions.map((tx) {
        //   return 
        // }).toList(),
      ),
    );
  }
}
