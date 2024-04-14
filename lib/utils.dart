import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:splitbliss/enums.dart';
import 'package:splitbliss/models/expense.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

late User? currentUser;
late List<String> parts;
late String firstName;
late String secondName;
late String? email;
late String? uid;
late String? displayName;
String userName = ''; //use for later variables
Color userColor = Colors.black;
// firestore references
CollectionReference userNameDocs =
    FirebaseFirestore.instance.collection('userNames');

CollectionReference userUidDocs =
    FirebaseFirestore.instance.collection('userDetails');

CollectionReference roomsRef = FirebaseFirestore.instance.collection('rooms');
//expenses individual related

String currentYear = DateTime.now().year.toString();
String currentMonth = getMonthName(DateTime.now().month);
List<Expense> expenses = [];
//functions
Category transformCategory(String s) {
  if (s == 'food') return Category.food;
  if (s == 'emi') return Category.emi;
  if (s == 'groceries') return Category.groceries;
  if (s == 'movies') return Category.movies;
  if (s == 'travel') return Category.travel;
  if (s == 'work') return Category.work;
  if (s == 'lend') return Category.lend;
  return Category.travel;
}

DateTime getLocalTime(Timestamp t) {
  // Convert Timestamp to DateTime
  DateTime dateTime = t.toDate();

  // Extract the date portion
  DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
  return dateOnly;
  // Print the date in a normal format
  // print(dateOnly); // Output: 2024-04-14 00:00:00.000
}

String getMonthName(int m) {
  List<String> month = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  return month[m];
}

void getCurrentUserDetails() {
  currentUser = FirebaseAuth.instance.currentUser;
  parts = currentUser!.displayName!.split(' ');
  firstName = parts[0];
  secondName = (parts.length >= 2) ? parts[1] : '';
  email = currentUser!.email;
  uid = currentUser!.uid;
  displayName = currentUser!.displayName!;
}

String getCharachters() {
  String name = currentUser!.displayName!;
  List<String> parts = name.split(' ');

  if (parts.length >= 2) {
    return parts[0][0] + parts[1][0];
  } else if (parts[0].length > 1) {
    return parts[0][0] + parts[0][1];
  } else {
    return parts[0][0];
  }
}

String getCustomisedCharacters(String name) {
  List<String> parts = name.split(' ');

  if (parts.length >= 2) {
    return parts[0][0] + parts[1][0];
  } else if (parts[0].length > 1) {
    return parts[0][0] + parts[0][1];
  } else {
    return parts[0][0];
  }
}

Color transformColor(String color) {
  int value = int.parse(color.replaceAll('Color(', '').replaceAll(')', ''));

  Color myColor = Color(value);
  return myColor;
}

void Message(BuildContext context, {String message = ''}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void getUserInfo() {
  print("userinfo is getting fetched");
  try {
    FirebaseFirestore.instance
        .collection('userDetails')
        .doc(currentUser!.uid)
        .get()
        .then((value) {
      userName = value.data()!['userName'];
      userColor = transformColor(value.data()!['color']);
    });
  } catch (error) {
    print(error);
  }
}

Color getBackGroundColor() {
  RandomColor _randomColor = RandomColor();
  Color randomColor;
  do {
    randomColor = _randomColor.randomColor();
  } while (randomColor.computeLuminance() < 0.4);
  return randomColor;
}
