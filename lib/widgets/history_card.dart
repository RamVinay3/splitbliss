// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({
    required this.amount,
  });

  int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            ""
          )
        ]
      ),
    );
  }
}
