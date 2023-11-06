import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final currentUser = FirebaseAuth.instance.currentUser;
final parts = currentUser!.displayName!.split(' ');
final firstName = parts[0];
final secondName = (parts.length >= 2) ? parts[1] : '';
final email = currentUser!.email;

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

Color transformColor(String color) {
  int value = int.parse(color.replaceAll('Color(', '').replaceAll(')', ''));

  Color myColor = Color(value);
  return myColor;
}
