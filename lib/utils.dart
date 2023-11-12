import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

late User? currentUser;
late List<String> parts;
late String firstName;
late String secondName;
late String? email;
late String? uid;
String userName = ''; //use for later variables
Color userColor = Colors.black;
// firestore references

CollectionReference userNameDocs =
    FirebaseFirestore.instance.collection('userNames');

CollectionReference userUidDocs =
    FirebaseFirestore.instance.collection('userDetails');

CollectionReference roomsRef = FirebaseFirestore.instance.collection('rooms');

void getCurrentUserDetails() {
  currentUser = FirebaseAuth.instance.currentUser;
  parts = currentUser!.displayName!.split(' ');
  firstName = parts[0];
  secondName = (parts.length >= 2) ? parts[1] : '';
  email = currentUser!.email;
  uid = currentUser!.uid;
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
