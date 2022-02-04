import 'package:uuid/uuid.dart';

class Transaction {
  final Uuid id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(this.id, this.title, this.amount, this.date);
}
