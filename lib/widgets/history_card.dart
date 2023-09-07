// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/widgets/svg.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({
    required this.amount,
    this.left = 10,
    this.right = 10,
  });

  int amount;
  double left, right;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      elevation: 5,
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(left),
          topRight: Radius.circular(right),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      child: Container(
        width: screenWidth * 0.53,
        padding: EdgeInsets.all(15),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "₹" + amount.toString(),
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 5),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SVG(svgPath: "./lib/svg/paidToIcon.svg"),
                SizedBox(width: 2),
                Text(
                  "Tapas Panipuri",
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 16,
                    color: Color(0xFF827979),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SVG(svgPath: "./lib/svg/payerIcon.svg"),
                SizedBox(width: 9),
                Text(
                  "Ram Vinay",
                  style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 16,
                    color: Color(0xFF827979),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "09:47 AM",
                style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 10,
                  color: Colors.grey,
                ),
              )),
        ]),
      ),
    );
  }
}
