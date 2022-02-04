import 'package:flutter/material.dart';
import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('1', 'New shoes', 69.99, DateTime.now()),
    Transaction('2', 'Cat food', 57.90, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            child: Text('CHART!'),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Text(transaction.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
