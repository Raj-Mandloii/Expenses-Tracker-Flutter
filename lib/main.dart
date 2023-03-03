import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  // String? titleInput;
  // String? amountInput;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter"),
        ),
        body: const SingleChildScrollView(
          child: UserTransaction(),
        ),
      ),
    );
  }
}
