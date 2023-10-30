// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/balance_card.dart';
import 'package:splitbliss/widgets/popup_menu.dart';
import 'package:splitbliss/widgets/spent_card.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/title_bar.dart';

import './add_payment.dart';

class NoDepositeRoom extends StatelessWidget {
  const NoDepositeRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: TitleBar(
        title: "Gear Five",
        actions: [PopupMenu()],
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: appColors.primary, size: 40),
        onPressed: () {
          print("Add Payment");
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddPayment();
          }));
        },
      ),
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
      child: ListView(padding: EdgeInsets.all(20), children: [
        Center(
            child: SpentCard(
          title: "Total Spents",
          amount: 5237,
          widthPercentage: 0.5,
        )),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SpentCard(
              title: "Yours Spends",
              amount: 1135,
              widthPercentage: 0.27,
              titleColor: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            SpentCard(
              title: "Your Gains ",
              amount: 1135,
              widthPercentage: 0.27,
              amountColor: Colors.green,
              titleColor: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            SpentCard(
              title: "Your Losses ",
              amount: 1135,
              widthPercentage: 0.27,
              amountColor: Colors.red,
              titleColor: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            BalanceCard(name: "Chiranjeevi", amount: 2000),
            SizedBox(
              height: 15,
            ),
            BalanceCard(name: "Samuel", amount: -1307),
            SizedBox(
              height: 15,
            ),
            BalanceCard(name: "Shiva Kiran", amount: 12345),
            SizedBox(
              height: 15,
            ),
            BalanceCard(name: "Nagasai", amount: 34),
            SizedBox(
              height: 15,
            ),
          ],
        )
      ]),
    );
  }
}
