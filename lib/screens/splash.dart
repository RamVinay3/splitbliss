import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/widgets/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String iconpath = 'lib/svg/splashIcon.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 70, 216),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SVG(svgPath: 'lib/svg/splashIcon.svg'),
            const SizedBox(
              height: 15,
            ),
            Text(
              'SplitBliss',
              style: GoogleFonts.robotoSerif(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
