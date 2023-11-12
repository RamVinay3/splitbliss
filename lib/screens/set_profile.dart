import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/title_bar.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class SetProfile extends StatefulWidget {
  const SetProfile({super.key, required this.createUserInfo});

  final void Function(String, Color) createUserInfo;

  @override
  State<SetProfile> createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  final currentUser = FirebaseAuth.instance.currentUser;
  Color backgroundColor = Colors.black;
  final _formKey = GlobalKey<FormState>();
  var username = '';
  void changeColor() {
    setState(() {
      backgroundColor = getBackGroundColor();
    });
    // return backgroundColor;
  }

  void checkProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(backgroundColor.toString());
      widget.createUserInfo(username, backgroundColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: 'Set Profile'),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            VerticalSpacer(space: 10),
            HistoryProfile(
              title: getCharachters(),
              size: 100,
              color: backgroundColor,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    appColors.primary.withAlpha(200)),
              ),
              onPressed: changeColor,
              icon: Icon(Icons.refresh),
              label: Text('change color'),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormField(
                        onSaved: (newValue) {
                          username = newValue!.trim();
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "username can't be empty";
                          }
                          if (value.contains(' ')) {
                            return "username should not consist space";
                          }
                          if (value.length < 4) {
                            return "length must be atleast 4 charachters";
                          }

                          //check for usernames if exists in firebase writing code

                          // if (docs.exists) {
                          //   return "username exists already";
                          // }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Username',
                        ),
                        maxLength: 20,
                      ),
                      VerticalSpacer(space: 10),
                      ElevatedButton(
                        onPressed: checkProfile,
                        child: Text('Done'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              appColors.primary.withAlpha(200)),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
