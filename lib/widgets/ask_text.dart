import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPoll extends StatelessWidget {
  const TextPoll({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 19,
      ),
    );
  }
}
