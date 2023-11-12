import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/horizontal_space.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard(
      {super.key, required this.message, required this.groupName});
  final String message;
  final String groupName;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRoboto(
                    title: widget.message,
                    weight: FontWeight.w500,
                    fontsize: 16,
                  ),
                  TextRoboto(
                    title: widget.groupName,
                    fontsize: 12,
                    color: appColors.greyPlaceHolder,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
