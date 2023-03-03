import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  // NewTransaction({required this.addTx});
  void submitdata() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addNewTransaction(
        titleController.text, double.parse(amountController.text));
  }

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
              onSubmitted: (_) => submitdata(),

              // onChanged: (value){
              //   titleInput = value.trim();
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
              // onChanged: (value){
              //   amountInput = value.trim();
              // },
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
