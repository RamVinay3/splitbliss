// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class HistoryProfile extends StatelessWidget {
  HistoryProfile({required this.title, this.size = 45});

  String title;
  double size;

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color backgroundColor = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
    );
    return Material(
      borderRadius: BorderRadius.circular(size),
      color: backgroundColor,
      child: Container(
          width: size,
          height: size,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: size / 2.25,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )),
    );
  }
}
