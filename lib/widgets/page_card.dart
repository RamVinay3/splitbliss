// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/svg.dart';

class PageCard extends StatelessWidget {
  PageCard({
    required this.path,
    required this.title,
    required this.onChanged,
    required this.value,
  });

  String path, title;
  bool value;
  Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SVG(svgPath: path),
            SizedBox(width: 15),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Switch.adaptive(
                value: value,
                activeColor: Color(0xFFF8CECE),
                activeTrackColor: Color(0xFF5FB3E3),
                onChanged: onChanged,
              ),
            ),
            SizedBox(width: 50),
            SVG(svgPath: "lib/svg/rightArrow.svg"),
          ],
        ),
        
      ],
    );
  }
}
