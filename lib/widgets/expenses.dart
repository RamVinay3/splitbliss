import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/models/expense.dart';
import 'package:splitbliss/streams/stream_personal_expenses.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/charts/chart.dart';
import 'package:splitbliss/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  @override
  void initState() {
    super.initState();
    // getIndividualExpenses(currentMonth, currentYear);
    expenses.clear();
    var collectExpenses = FirebaseFirestore.instance
        .collection('individual')
        .doc(userName)
        .collection(currentYear)
        .doc('expenses')
        .collection(currentMonth);
    collectExpenses.get().then((QuerySnapshot querySnapshot) {
      // Iterate over the documents
      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        // Access data of each document
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Expense e = new Expense(
            category: transformCategory(data['category']),
            title: data['reason'],
            amount: data['amount'],
            date: getLocalTime(data['date']));
        setState(() {
          expenses.add(e);
        });
        print(e);
      });
    }).catchError((error) {
      // Handle any errors that occur
      print("Something went wrong fetching personal expenses");
    });
  }

  void addExpenses(Expense e) {
    Map<String, dynamic> obj = {
      'amount': e.amount,
      'category': e.category.name,
      'date': e.date,
      'reason': e.title,
      'id': e.id
    };
    print(e.date.month);
    print(e.date.year);
    String month = getMonthName(e.date.month);

    var collected = FirebaseFirestore.instance
        .collection('individual')
        .doc(userName)
        .collection(e.date.year.toString())
        .doc('expenses')
        .collection(month)
        .doc(e.id)
        .set(obj);
    collected.then((value) {
      Message(context, message: 'Expense added succesfully');

      if (currentMonth == month) {
        setState(() {
          expenses.add(e);
        });
      }
    }).catchError((error) {
      Message(context, message: 'Something wrong with network');
    });
  }

  void removeExpense(Expense e) {
    final expensePos = expenses.indexOf(e);
    setState(() {
      expenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('item has been removed'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                expenses.insert(expensePos, e);
              });
            }),
      ),
    );
  }

  void openAddExpenseModel() {
    //..logic to open it.
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          //here we have to return our own widget which we wanna show.
          return NewExpense(addExpenses);
        });
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // if (expenses.isNotEmpty) {
    //   mainContent = ExpensesList(expense: expenses, onSlide: removeExpense);
    // }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Track your expense'),
          actions: [
            IconButton(
                onPressed: openAddExpenseModel, icon: const Icon(Icons.add))
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: expenses),

                  //column has list as it child
                  //so flutter won't know how to display just get it done
                  //using expanded
                  Expanded(
                    child: ExpensesList(onSlide: removeExpense),
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: expenses)),

                  //column has list as it child
                  //so flutter won't know how to display just get it done
                  //using expanded
                  Expanded(
                    child: ExpensesList(onSlide: removeExpense),
                  )
                ],
              ));
  }
}
