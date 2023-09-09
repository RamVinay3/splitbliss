// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class UserCard extends StatelessWidget {
  UserCard({required this.user, required this.color});

  String user;
  Color color;

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color backgroundColor = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
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
