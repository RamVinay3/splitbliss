import 'package:flutter/material.dart';
import 'package:splitbliss/models/expense.dart';
import 'package:splitbliss/widgets/horizontal_space.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(categoryIcons[expense.category]),
              HorizontalSpacer(space: 20),
              Text('₹ ' + expense.amount.toStringAsFixed(2)),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.calendar_month_rounded),
                  Text(expense.getFormattedDate),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
