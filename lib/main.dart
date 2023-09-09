// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:splitbliss/screens/add_poll.dart';
import 'package:splitbliss/screens/deposit_mode.dart';
import 'package:splitbliss/screens/nodeposit_user.dart';
import 'package:splitbliss/screens/payment_history.dart';
// import 'package:splitbliss/screens/login.dart';
import 'package:splitbliss/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DepositeMode(),
      // home: AddPoll(),
    );
  }
}
