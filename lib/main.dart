import 'dart:io';

import 'package:expenses_tracker/widgets/chart.dart';
import 'package:flutter/material.dart';
// you also need this import.
// import 'package:flutter/services.dart';
import './models/transactions.dart';
import './widgets/new_transaction.dart';

import './widgets/user_transaction.dart';

void main() {
  // in case you want to inforce portrait mode to app.
  // or disable landscape mode in app.
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(
    MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "Quicksand",
        // appBarTheme: ThemeData.light()
      ),
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transactions> _userTransactions = [
    // Transactions(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 700,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: 't2',
    //   title: 'New Grosseries',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transactions> get _recentTransaction {
    return _userTransactions.where((el) {
      return el.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transactions(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bCtx) {
        return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction));
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  bool _showChart = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      title: const Text("Personal Expenses"),
      actions: [
        IconButton(
          onPressed: () => startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appbar.preferredSize.height -
              mediaQuery.padding.top) *
          0.8,
      child: UserTransaction(_userTransactions, _deleteTransaction),
    );

    return Scaffold(
      appBar: appbar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              onPressed: () => startAddNewTransaction(context),
              child: const Icon(Icons.add),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Show chart"),
                  Switch.adaptive(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            if (!isLandscape)
              Container(
                  height: (mediaQuery.size.height -
                          appbar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.3,
                  child: Chart(recentTransactions: _recentTransaction)),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appbar.preferredSize.height -
                              mediaQuery.padding.top) *
                          1,
                      child: Chart(recentTransactions: _recentTransaction))
                  : txListWidget,
          ],
        ),
      ),
    );
  }
}
