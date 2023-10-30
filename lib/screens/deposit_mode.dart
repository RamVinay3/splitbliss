import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/deposit_member_tab.dart';
import 'package:splitbliss/widgets/elevated_container.dart';
import 'package:splitbliss/widgets/poll_tab.dart';
import 'package:splitbliss/widgets/popup_menu.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/widgets/title_bar.dart';

import './add_payment.dart';

class DepositeMode extends StatelessWidget {
  const DepositeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.Surface94,
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
    return Column(
      children: [
        ElevatedContainer(
          children: [
            SimpleTile(
              parameter: 'Total Money',
              value: '10000',
              color: appColors.onPrimaryContainer,
            ),
            SimpleTile(
              parameter: 'Balance',
              value: '7000',
              color: appColors.territiary,
            ),
            SimpleTile(
              parameter: 'Spents',
              value: '3000',
              color: appColors.loss,
            ),
            SimpleTile(
              parameter: 'Individual Money',
              value: '1000',
              color: appColors.profit,
            )
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.56,
          // color: Colors.black,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: appColors.skyblue,
                  child: TabBar(
                    indicatorColor: appColors.primary,
                    unselectedLabelColor: Colors.black.withOpacity(0.8),
                    labelColor: Colors.black,
                    overlayColor: MaterialStateProperty.all(Colors.black),
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: [
                      Tab(child: Text('Members')),
                      Tab(child: Text('Poll'))
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    MemberTab(),
                    PollTab(),
                  ]),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SimpleTile extends StatelessWidget {
  const SimpleTile(
      {super.key,
      required this.parameter,
      required this.value,
      required this.color});
  final String parameter;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextRoboto(
        title: parameter,
        color: appColors.onPrimaryContainer,
        weight: FontWeight.w500,
        fontsize: 18,
      ),
      trailing: TextRoboto(
        title: value.toString(),
        color: color,
        weight: FontWeight.w400,
        fontsize: 16,
      ),
    );
  }
}
