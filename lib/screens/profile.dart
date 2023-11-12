import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/profile_detail_card.dart';
import 'package:splitbliss/widgets/profile_options.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final currentUser = FirebaseAuth.instance.currentUser;
  DocumentSnapshot<Map<String, dynamic>>? userSnap = null;
  List<String> parts = currentUser!.displayName!.split(' ');

  void getUserInfo() {
    // print("userinfo is getting fetched");
    try {
      FirebaseFirestore.instance
          .collection('userDetails')
          .doc(currentUser!.uid)
          .get()
          .then((value) {
        if (mounted) {
          setState(() {
            userSnap = value;
          });
        }
      });
    } catch (error) {
      print(error);
    }
    // print("userinfo is done");
  }

  @override
  void initState() {
    // print("started intialising");
    super.initState();
    getUserInfo();
    // print("ended intialising");
  }

  @override
  Widget build(BuildContext context) {
    // print("entered build");
    if (userSnap == null) {
      return Center(
        child: CircularProgressIndicator(
          color: appColors.primary,
        ),
      );
    }
    return Scaffold(
      backgroundColor: appColors.Surface94,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VerticalSpacer(space: 67),
                  HistoryProfile(
                    title: getCharachters(),
                    size: 120,
                    color: transformColor(userSnap!.data()!["color"]),
                  ),
                  VerticalSpacer(space: 20),
                  Text(
                    currentUser!.displayName!,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '@${userSnap!.data()!['userName']}',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  ProfileDetailsCard(
                    userName: userSnap!.data()!['userName'],
                  ),
                  VerticalSpacer(space: 20),
                  ProfileOptions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
