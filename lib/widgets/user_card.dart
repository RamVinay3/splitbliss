// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

import './text_inter.dart';

class UserCard extends StatelessWidget {
  UserCard({required this.user, required this.color, required this.onPress});

  String user;
  Color color;
  final void Function(String value) onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextInter(
              title: user,
              fontsize: 14,
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                onPress(user);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 8,
                child: Icon(Icons.close, size: 12),
              ),
            )
          ],
        ));
  }
}
