import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<Transactions> transactions = [
    Transactions(
      id: 't1',
      title: 'New Shoes',
      amount: 700,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'New Grosseries',
      amount: 1000,
      date: DateTime.now(),
    ),
  ];
  // String? titleInput;
  // String? amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter"),
        ),
        body: Column(
          children: [
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                     TextField(
                      decoration:const InputDecoration(labelText: "Title"),
                      controller: titleController,
                      // onChanged: (value){
                      //   titleInput = value.trim();
                      // },
                    ),
                     TextField(
                      decoration: const InputDecoration(labelText: "Amount"),
                      controller: amountController,

                      // onChanged: (value){
                      //   amountInput = value.trim();
                      // },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          alignment: Alignment.bottomRight),
                      onPressed: () {
                        print(titleController);
                        print(amountController);
                      },
                      child: const Text("Add Transaction"),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(children: [
                    Container(
                      width: 120,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat().format(tx.date),
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        )
                      ],
                    )
                  ]),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
