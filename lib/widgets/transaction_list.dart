// import '../models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List userTransactions;
  final Function deleteTx;
  const TransactionList(
      {Key? key, required this.userTransactions, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constriants) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text("No transactions added yet"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                       height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, i) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Container(
                      height: 20,
                      child: FittedBox(
                        child: Text(
                            '\$${userTransactions[i].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(userTransactions[i].title),
                  subtitle: Text(DateFormat().format(userTransactions[i].date)),
                  trailing: IconButton(
                    onPressed: () => deleteTx(userTransactions[i].id),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.teal,
                    ),
                  ),
                ),
              );
            },
            itemCount: userTransactions.length,
            // children: userTransactions.map((tx) {
            //   return
            // }).toList(),
          );
  }
}
