import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'transaction_list.dart';
import 'new_transactions.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewTransaction(addNewTransaction: _addNewTransaction),
          TransactionsList(
            userTransactions: _userTransactions,
          ),
        ],
      ),
    );
  }
}
