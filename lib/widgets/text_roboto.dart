import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/colors.dart';

class TextRoboto extends StatelessWidget {
  const TextRoboto({
    super.key,
    required this.title,
    this.fontsize = 18,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
  });
  final String title;
  final double? fontsize;
  final Color? color;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: fontsize,
        fontWeight: weight,
        color: color,
      ),
      textAlign: TextAlign.left,
    );
  }
}
