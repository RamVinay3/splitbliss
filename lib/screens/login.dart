import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/widgets/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double left = 0.051 * screenWidth;
    final double right = 0.051 * screenWidth;
    final double top = 0.035 * screenHeight;
    final double bottom = 0.053 * screenHeight;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.fromLTRB(left, top, right, bottom),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'SplitBliss',
                    style: GoogleFonts.robotoSerif(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      // height: 36,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.071 * screenHeight,
                ),
                const SVG(svgPath: 'lib/svg/loginPageLogo.svg'),
                SizedBox(
                  height: 0.071 * screenHeight,
                ),
                Container(
                  width: 0.734 * screenWidth,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 249, 248, 249),
                          Color.fromARGB(255, 249, 248, 249)
                        ],
                      ),
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    'Enter the world of smart and efficient money splitting',
                    style: GoogleFonts.robotoSerif(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,

                      // height: 36,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.084 * screenHeight,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 0.651 * screenWidth,
                      padding: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 13),
                      child: Row(children: [
                        const SVG(
                          svgPath: 'lib/svg/GoogleIcon.svg',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Continue with google',
                          style: GoogleFonts.dmSans(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.10 * screenHeight,
                ),
                Text(
                  'By signing in, you accept our ',
                  style: GoogleFonts.dmSans(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff6B7280)
                      // color: Color.fromARGB(255, 107, 114, 128)
                      ),
                ),
                Text(
                  'Terms of Service & Privacy Policy',
                  style: GoogleFonts.dmSans(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff6B7280),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
