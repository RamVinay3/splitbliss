import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/profile_detail_card.dart';
import 'package:splitbliss/widgets/profile_options.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double left = 0.051 * screenWidth;
    final double right = 0.051 * screenWidth;
    final double top = 0.035 * screenHeight;
    final double bottom = 0.053 * screenHeight;
    return Scaffold(
      backgroundColor: appColors.Surface94,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpacer(space: 67),
                HistoryProfile(
                  title: 'CV',
                  size: 120,
                ),
                VerticalSpacer(space: 20),
                Text(
                  'Parijatham Chiranjeevi',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'chiru@25',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                ProfileDetailsCard(),
                VerticalSpacer(space: 20),
                ProfileOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
