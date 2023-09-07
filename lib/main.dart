import 'package:flutter/material.dart';
// import 'package:splitbliss/screens/add_payment.dart';
import 'package:splitbliss/screens/payment_history.dart';
// import 'package:splitbliss/screens/add_payment.dart';


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
      home: PaymentHistory(),
    );
  }
}
