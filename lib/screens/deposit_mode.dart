import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/screens/add_poll.dart';
import 'package:splitbliss/widgets/deposit_member_tab.dart';
import 'package:splitbliss/widgets/elevated_container.dart';
import 'package:splitbliss/widgets/poll_tab.dart';
import 'package:splitbliss/widgets/popup_menu.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/widgets/title_bar.dart';

import './add_payment.dart';

class DepositeMode extends StatefulWidget {
  const DepositeMode(
      {super.key, required this.roomInfo, required this.totalMoney});
  final Map<String, dynamic> roomInfo;
  final int totalMoney;

  @override
  State<DepositeMode> createState() => _DepositeModeState();
}

class _DepositeModeState extends State<DepositeMode>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // void toggleFloatFunctionality() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.Surface94,
      appBar: TitleBar(
        title: widget.roomInfo["roomTitle"],
        actions: [
          PopupMenu(
            room: widget.roomInfo,
          )
        ],
      ),
      body: UI(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: appColors.primary, size: 40),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            if (_tabController.index == 0) {
              return AddPayment();
            } else {
              return AddPoll();
            }
          }));
        },
      ),
    );
  }

  Column UI(BuildContext context) {
    return Column(
      children: [
        ElevatedContainer(
          children: [
            SimpleTile(
              parameter: 'Total Money',
              value: widget.totalMoney.toString(),
              color: appColors.onPrimaryContainer,
            ),
            SimpleTile(
              parameter: 'Balance',
              value: '${widget.totalMoney - widget.roomInfo['spents']}',
              color: appColors.territiary,
            ),
            SimpleTile(
              parameter: 'Spents',
              value: widget.roomInfo['spents'].toString(),
              color: appColors.loss,
            ),
            SimpleTile(
              parameter: 'Individual Money',
              value: widget.roomInfo['individualMoney'].toString(),
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
                    controller: _tabController,
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
                  child: TabBarView(controller: _tabController, children: [
                    MemberTab(room: widget.roomInfo),
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
