// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.title
  });

  String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // bottom button
      onPressed: () {},
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
          backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9))),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
