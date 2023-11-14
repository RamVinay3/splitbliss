// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/history_profile.dart';

class MemberCard extends StatelessWidget {
  MemberCard(
      {required this.profile,
      required this.name,
      required this.uname,
      required this.color});

  String profile, name, uname, color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          HistoryProfile(
            title: profile,
            size: 40,
            color: transformColor(color),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                uname,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFACA8A8)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
