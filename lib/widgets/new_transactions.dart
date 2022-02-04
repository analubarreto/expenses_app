import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            enableSuggestions: true,
            autofocus: true,
            onSubmitted: (_) => submitData(),
            decoration: const InputDecoration(
              hintText: 'Product\'s name',
              label: Text('Product name'),
            ),
            controller: titleController,
          ),
          TextField(
            enableSuggestions: true,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
            decoration: const InputDecoration(
              hintText: 'Products\'s price',
              label: Text('Price'),
            ),
            controller: amountController,
          ),
          OutlinedButton(
            onPressed: submitData,
            child: const Text('Add transaction'),
            style: TextButton.styleFrom(enableFeedback: true),
          )
        ],
      ),
    );
  }
}
