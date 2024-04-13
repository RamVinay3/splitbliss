import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/expenses.dart';

class UserSpace extends StatefulWidget {
  const UserSpace({super.key});

  @override
  State<UserSpace> createState() => _UserSpaceState();
}

class _UserSpaceState extends State<UserSpace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expenses(),
    );
  }
}
