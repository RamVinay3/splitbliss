// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  UserCard({required this.user, required this.color});

  String user;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(
        user,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
