import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/horizontal_space.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    this.personal = false,
    this.roomName,
    this.members,
  });
  final bool personal;
  final String? roomName;
  final int? members;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Container(
          // width: double.infinity,
          padding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 20),
          // margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              HistoryProfile(
                title: 'RV',
                size: 40,
              ),
              HorizontalSpacer(space: 15),
              if (personal)
                Personal(name: 'Ramvinay3', username: 'ramvinay609'),
              if (!personal) Group(name: roomName!, members: members!),
              if (!personal) SVG(svgPath: 'lib/svg/addTransaction.svg')
            ],
          ),
        ),
      ),
    );
  }
}

class Personal extends StatelessWidget {
  const Personal({super.key, required this.name, required this.username});
  final String name;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRoboto(title: name, weight: FontWeight.w500),
        TextRoboto(
          title: username,
          fontsize: 12,
          color: appColors.greyPlaceHolder,
        )
      ],
    );
  }
}

class Group extends StatelessWidget {
  const Group({super.key, required this.name, required this.members});
  final String name;
  final int members;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRoboto(title: name, weight: FontWeight.w500),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.group, color: Color(0xff44BDFF)),
              HorizontalSpacer(space: 3),
              TextRoboto(
                title: "${members} members",
                fontsize: 14,
                color: appColors.greyPlaceHolder,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
