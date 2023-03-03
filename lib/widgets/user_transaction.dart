import '../models/transactions.dart';
import "package:flutter/material.dart";
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  UserTransactionState createState() => UserTransactionState();
}

class UserTransactionState extends State<UserTransaction> {
  final List<Transactions> _userTransactions = [
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

  void _addNewTransaction(String title, double amount) {
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction: _addNewTransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
