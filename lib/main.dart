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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            child: Text('CHART!'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.elliptical(10.0, 10.0),
                        ),
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        transaction.amount.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.teal),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          transaction.date.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
