// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/history_card.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import '../widgets/title_bar.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: "History"),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F0F0),
      width: double.infinity,
      
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryProfile(title: "RV"),
              SizedBox(width: 5),
              HistoryCard(amount: 100, left: 0),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryCard(amount: 100, right: 0),
              SizedBox(width: 5),
              HistoryProfile(title: "RV"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryProfile(title: "RV"),
              SizedBox(width: 5),
              HistoryCard(amount: 100, left: 0),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryCard(amount: 100, right: 0),
              SizedBox(width: 5),
              HistoryProfile(title: "RV"),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryProfile(title: "RV"),
              SizedBox(width: 5),
              HistoryCard(amount: 100, left: 0),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryCard(amount: 100, right: 0),
              SizedBox(width: 5),
              HistoryProfile(title: "RV"),
            ],
          ),
          SizedBox(height: 30),
          
        ],
      ),
    );
  }
}
