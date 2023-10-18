import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SimpleIconTile(
              parameter: 'Share your feedback',
              path: 'lib/svg/feedback.svg',
            ),
            SimpleIconTile(
              parameter: 'Contact Us',
              path: 'lib/svg/contact.svg',
            ),
            SimpleIconTile(
              parameter: 'Logout',
              path: 'lib/svg/logout.svg',
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleIconTile extends StatelessWidget {
  const SimpleIconTile(
      {super.key, required this.parameter, required this.path});
  final String parameter;
  final String path;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: TextRoboto(
          title: parameter,
          color: appColors.onPrimaryContainer,
          weight: FontWeight.w500,
          fontsize: 16,
        ),
        leading: SVG(svgPath: path));
  }
}
