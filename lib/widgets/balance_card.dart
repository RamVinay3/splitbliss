// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({
    required this.name,
    required this.amount,
  });

  String name;
  int amount;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 25),
          width: double.infinity,
          child: Row(
            children: [
              Text(name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Spacer(),
              Text(amount > 0 ? "+ $amount" : "$amount",
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w500,
                    color: amount > 0 ? Colors.green : Colors.red,
                  )
              ),
            ],
          )),
    );
  }
}
