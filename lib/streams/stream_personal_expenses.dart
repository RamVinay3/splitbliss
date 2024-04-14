import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/models/expense.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/expense_card.dart';

class ExpensesList extends StatefulWidget {
  ExpensesList({super.key, required this.onSlide});
  final void Function(Expense e) onSlide;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  String month = currentMonth;

  String year = currentYear;

  // final List<Expense> expense;
  @override
  Widget build(context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('individual')
            .doc(userName)
            .collection(year)
            .doc('expenses')
            .collection(month)
            .snapshots(),
        builder: (((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // or any loading indicator
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Add Your First Expenses in this month'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              Expense e = new Expense(
                  category: transformCategory(data['category']),
                  title: data['reason'],
                  amount: data['amount'],
                  date: getLocalTime(data['date']));
              return ExpenseCard(expense: e);
            }).toList(),
          );
        })));
  }
}
