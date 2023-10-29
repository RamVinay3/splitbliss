import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInter extends StatelessWidget {
  const TextInter({
    super.key,
    required this.title,
    this.fontsize = 18,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    this.alignment = TextAlign.left,
  });
  final String title;
  final double? fontsize;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? alignment;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: fontsize,
        fontWeight: weight,
        color: color,
      ),
      textAlign: alignment,
    );
  }
}
