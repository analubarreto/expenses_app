import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              enableSuggestions: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Product\'s name',
                hintStyle: TextStyle(color: Colors.black26),
                label: Text('Product name'),
              ),
              style: const TextStyle(color: Colors.black87),
              controller: titleController,
            ),
            TextField(
              enableSuggestions: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Products\'s price',
                hintStyle: TextStyle(color: Colors.black26),
                label: Text('Price'),
              ),
              style: const TextStyle(color: Colors.black87),
              controller: amountController,
            ),
            OutlinedButton(
              onPressed: () {
                addNewTransaction(
                    titleController.text, double.parse(amountController.text));
              },
              child: const Text('Add transaction'),
              style: TextButton.styleFrom(
                  primary: Colors.teal,
                  backgroundColor: Colors.transparent,
                  enableFeedback: true),
            )
          ],
        ),
      ),
    );
  }
}
