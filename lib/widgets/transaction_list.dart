import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionsList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.scaleDown),
                ),
              ],
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
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
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userTransactions[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            DateFormat('dd/MM/yy')
                                .format(userTransactions[index].date),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
