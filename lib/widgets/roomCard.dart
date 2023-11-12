import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/screens/add_payment.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/horizontal_space.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

class RoomCard extends StatefulWidget {
  const RoomCard(
      {super.key,
      this.personal = false,
      this.roomName,
      this.members,
      this.roomColor});
  final bool personal;
  final String? roomName;
  final int? members;
  final Color? roomColor;

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

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
              if (!widget.personal)
                HistoryProfile(
                  title: getCustomisedCharacters(widget.roomName!),
                  size: 40,
                  color: (widget.roomColor is Color)
                      ? widget.roomColor!
                      : Colors.black,
                ),
              if (widget.personal)
                HistoryProfile(
                  title: getCharachters(),
                  color: userColor,
                  size: 40,
                ),
              HorizontalSpacer(space: 15),
              if (widget.personal)
                Personal(
                    name: '${firstName} ${secondName}', username: userName),
              if (!widget.personal)
                Group(name: widget.roomName!, members: widget.members!),
              if (!widget.personal)
                InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AddPayment();
                      }));
                    },
                    child: SVG(svgPath: 'lib/svg/addTransaction.svg'))
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
