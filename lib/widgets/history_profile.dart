// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

class HistoryProfile extends StatelessWidget {
  HistoryProfile(
      {required this.title, this.size = 45, this.color = Colors.black});
  Color color;
  String title;
  double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(size),
      color: color,
      child: Container(
          width: size,
          height: size,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: size / 2.25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
