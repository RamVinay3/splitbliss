import 'package:flutter/material.dart';
import 'package:splitbliss/models/expense.dart';
import 'package:splitbliss/widgets/expense_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense, required this.onSlide});
  final void Function(Expense e) onSlide;
  final List<Expense> expense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: ((context, index) {
        return ExpenseCard(expense: expense[index]);
      }),
    );
  }
}
