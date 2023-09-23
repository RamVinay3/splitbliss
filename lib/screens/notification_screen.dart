import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/dummy%20data/notify.dart';
import 'package:splitbliss/widgets/notification_card.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  DateTime now = DateTime.now();

  bool intialToday = true;
  bool intialPrevious = true;
  bool check(DateTime notifyDate) {
    if (notifyDate == null || now == null) return false;
    // print('nothing comes here');
    var difference = now.difference(notifyDate);
    // print(difference.inDays);
    // print("intialToday: ${intialToday}");
    // print("intialPrevious: ${intialPrevious}");
    if (difference.inDays == 0 && intialToday) {
      print('Ima in if');
      intialToday = false;
      return true;
    } else if (difference.inDays > 1 && intialPrevious) {
      print('Ima in else if');
      intialPrevious = false;
      return true;
    } else
      return false;
  }

  bool isToday(DateTime notifyDate) {
    return now.year == notifyDate.year &&
        now.day == notifyDate.day &&
        now.month == notifyDate.month;
  }

  @override
  Widget build(BuildContext context) {
    intialToday = true;
    intialPrevious = true;
    return Scaffold(
      backgroundColor: appColors.Surface94,
      body: Container(
        child: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: notify.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (check(notify[index].date))
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextRoboto(
                            title: (isToday(notify[index].date))
                                ? 'Today'
                                : "Previous",
                            color: appColors.onSurfaceText,
                            weight: FontWeight.w700,
                          ),
                        ),
                      NotificationCard(
                        message: notify[index].message,
                        groupName: notify[index].groupname,
                      )
                    ],
                  );
                })
            // Column(
            //   children: [
            //     const NotificationCard(
            //       message: 'You are added to a new room',
            //       groupName: 'gear 5 Nika man',
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
}
