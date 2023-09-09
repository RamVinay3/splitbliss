// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/svg.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    required this.path,
    required this.title,
  });

  String path, title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SVG(svgPath: path),
        SizedBox(width: 10),
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
