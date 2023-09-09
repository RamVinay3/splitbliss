// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SpentCard extends StatelessWidget {
  SpentCard({
    required this.title,
    required this.amount,
    required this.widthPercentage,
    this.titleColor = Colors.black,
    this.amountColor = Colors.black,
  });

  Color titleColor, amountColor;
  String title;
  int amount;
  double widthPercentage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(
        width: screenWidth * widthPercentage,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(title,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: titleColor))),
            SizedBox(height: 10),
            Text(amount.toString(),
                style: TextStyle(fontSize: 84 * widthPercentage, fontWeight: FontWeight.w500, color: amountColor)),
            SizedBox(height: 40 * widthPercentage),
          ],
        ),
      ),
    );
  }
}
