import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:splitbliss/models/expense.dart';
import 'package:splitbliss/utils.dart';

void getIndividualExpenses(month, year) {
  expenses.clear();
  var collectExpenses = FirebaseFirestore.instance
      .collection('individual')
      .doc(userName)
      .collection(year)
      .doc('expenses')
      .collection(month);
  print('firebase pcak');
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

      expenses.add(e);
      print(e);
    });
  }).catchError((error) {
    // Handle any errors that occur
    print("Something went wrong fetching personal expenses");
  });
}
