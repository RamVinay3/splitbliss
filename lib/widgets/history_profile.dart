// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HistoryProfile extends StatelessWidget {
  HistoryProfile({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(45),
      color: Color(0xFFCB06EB),
      child: Container(
        width: 45,
        height: 45,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        )
      ),
    );
  }
}
