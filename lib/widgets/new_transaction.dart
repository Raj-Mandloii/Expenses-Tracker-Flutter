import "package:flutter/material.dart";

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  void submitdata() {
    final enteredTitle = titleController.text;
    final enteredAmount =  double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
        titleController.text, double.parse(amountController.text));

        Navigator.of(context).pop();
  }
  // NewTransaction({required this.addTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              // onSubmitted: (_) => submitdata(),

              // onChanged: (value){
              //   titleInput = value.trim();
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
            ),
            TextButton(
              style: TextButton.styleFrom(alignment: Alignment.bottomRight),
              onPressed: submitdata,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
