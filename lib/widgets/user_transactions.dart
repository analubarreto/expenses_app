import 'package:flutter/material.dart';
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
    Transaction('1', 'New shoes', 69.99, DateTime.now()),
    Transaction('2', 'Cat food', 57.65, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NewTransaction(),
          TransactionsList(
            userTransactions: _userTransactions,
          ),
        ],
      ),
    );
  }
}
