import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/google_auth.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/text_inter.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

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
              onTap: () {
                _showFeedbackDialog(context);
              },
            ),
            SimpleIconTile(
              parameter: 'Contact Us',
              path: 'lib/svg/contact.svg',
              onTap: () {
                _showContactDetails(context);
              },
            ),
            SimpleIconTile(
              parameter: 'Logout',
              path: 'lib/svg/logout.svg',
              onTap: () {
                Google().GoogleSignOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showContactDetails(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 2,
            title: TextInter(title: 'Contact Us at', weight: FontWeight.w700),
            content: Text('splitbliss1@gmail.com'),
          );
        });
  }

  void _showFeedbackDialog(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Share Your Feedback'),
          content: SingleChildScrollView(
            child: TextField(
              controller: feedbackController,
              decoration:
                  InputDecoration(labelText: 'Enter your feedback here'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the feedback, for example, send it to an API
                String feedback = feedbackController.text;
                print('Feedback: $feedback');
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class SimpleIconTile extends StatelessWidget {
  const SimpleIconTile(
      {super.key,
      required this.parameter,
      required this.path,
      required this.onTap});
  final String parameter;
  final String path;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: TextRoboto(
          title: parameter,
          color: appColors.onPrimaryContainer,
          weight: FontWeight.w500,
          fontsize: 16,
        ),
        leading: SVG(svgPath: path));
  }
}
