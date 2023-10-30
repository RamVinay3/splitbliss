// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/text_inter.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.title, this.color, required this.onPress});
  Color? color;
  String title;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      color = Color(0xFFD9D9D9);
    }
    return ElevatedButton(
        // bottom button
        onPressed: onPress,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
            backgroundColor: MaterialStateProperty.all(color)),
        child: TextInter(
          title: title,
          color: Colors.white,
          weight: FontWeight.w500,
          fontsize: 22,
        ));
  }
}
