import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'widgets/new_transactions.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expenses app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(const Uuid(), 'New shoes', 69.99, DateTime.now()),
    Transaction(const Uuid(), 'Cat food', 57.65, DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(const Uuid(), txTitle, txAmount, DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
      txTitle = '';
      txAmount = 0;
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      elevation: 2,
      enableDrag: true,
      context: ctx,
      builder: (_) {
        return NewTransaction(addNewTransaction: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.teal,
        shadowColor: Colors.black45,
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white70,
            ),
          ),
        ],
        title: const Text('Expenses app'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Card(
            child: Text('CHART!'),
          ),
          TransactionsList(
            userTransactions: _userTransactions,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
