// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/widgets/balance_card.dart';
import 'package:splitbliss/widgets/elevated_container.dart';
import 'package:splitbliss/widgets/history_profile.dart';
import 'package:splitbliss/widgets/horizontal_space.dart';
import 'package:splitbliss/widgets/popup_menu.dart';
import 'package:splitbliss/widgets/spent_card.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/text_inter.dart';
import 'package:splitbliss/widgets/text_roboto.dart';
import 'package:splitbliss/widgets/title_bar.dart';
import 'package:splitbliss/widgets/vertical_space.dart';

import './add_payment.dart';

class NoDepositeRoom extends StatefulWidget {
  const NoDepositeRoom({super.key, required this.roomInfo});
  final Map<String, dynamic> roomInfo;

  @override
  State<NoDepositeRoom> createState() => _NoDepositeRoomState();
}

class _NoDepositeRoomState extends State<NoDepositeRoom> {
  @override
  Widget build(BuildContext context) {
    Widget PayMode = ElevatedContainer(padding: 20, children: [
      Row(
        children: [
          SVG(svgPath: 'lib/svg/moneyNeedToPay.svg'),
          HorizontalSpacer(space: 10),
          TextRoboto(title: 'people you need to pay', fontsize: 16),
        ],
      ),
      VerticalSpacer(space: 15),
      Row(
        children: [
          HistoryProfile(
            title: 'R ',
            size: 35,
          ),
          HorizontalSpacer(space: 7),
          TextInter(
            title: 'Ram Charan',
            fontsize: 16,
            weight: FontWeight.w500,
          ),
          HorizontalSpacer(space: 15),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInter(
                title: '₹640',
                color: appColors.loss,
                alignment: TextAlign.right,
                weight: FontWeight.w700,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    print('changed to pending');
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColors.paymentRed,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                      child: Column(
                        children: [
                          TextInter(
                            title: 'Confirm ',
                            fontsize: 8,
                            color: Colors.black,
                            weight: FontWeight.w600,
                          ),
                          TextInter(
                            title: ' My Payment',
                            fontsize: 8,
                            color: Colors.black,
                            weight: FontWeight.w600,
                          ),
                        ],
                      )),
                ),
              )
            ],
          ))
        ],
      )
    ]);

    Widget receiveMode = ElevatedContainer(padding: 20, children: [
      Row(
        children: [
          SVG(svgPath: 'lib/svg/receiveMoney.svg'),
          HorizontalSpacer(space: 10),
          TextRoboto(title: 'people you need to pay', fontsize: 16),
        ],
      ),
      VerticalSpacer(space: 15),
      Row(
        children: [
          HistoryProfile(
            title: 'RC',
            size: 40,
          ),
          HorizontalSpacer(space: 10),
          TextInter(
            title: 'Ram Charan',
            fontsize: 16,
            weight: FontWeight.w500,
          ),
          HorizontalSpacer(space: 15),
          Expanded(
            child: TextInter(
              title: '₹640',
              color: appColors.profit,
              alignment: TextAlign.right,
              weight: FontWeight.w700,
            ),
          )
        ],
      )
    ]);

    Widget confirmPayments = ElevatedContainer(padding: 20, children: [
      Row(
        children: [
          SVG(svgPath: 'lib/svg/confirmPayments.svg'),
          HorizontalSpacer(space: 10),
          TextRoboto(title: 'confirm payments', fontsize: 16),
        ],
      ),
      VerticalSpacer(space: 15),
      Row(
        children: [
          HistoryProfile(
            title: 'R ',
            size: 35,
          ),
          HorizontalSpacer(space: 7),
          TextInter(
            title: 'Ram Charan',
            fontsize: 16,
            weight: FontWeight.w500,
          ),
          HorizontalSpacer(space: 15),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInter(
                title: '₹640',
                color: appColors.loss,
                alignment: TextAlign.right,
                weight: FontWeight.bold,
                fontsize: 14,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: SVG(svgPath: 'lib/svg/paymentDone.svg'),
                  ),
                  HorizontalSpacer(space: 20),
                  InkWell(
                    child: SVG(svgPath: 'lib/svg/paymentNotDone.svg'),
                  )
                ],
              ))
            ],
          ))
        ],
      )
    ]);
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: TitleBar(
        title: widget.roomInfo['roomTitle'],
        actions: [
          PopupMenu(
            room: widget.roomInfo,
          )
        ],
      ),
      body: ListView(
        children: [
          ElevatedContainer(
            children: [
              SimpleTile(parameter: 'Total Spents', value: '0'),
              SimpleTile(parameter: 'Unsettled Amount', value: '0'),
              SimpleTile(parameter: 'Debt', value: '0')
            ],
          ),
          VerticalSpacer(space: 20),
          PayMode,
          receiveMode,
          confirmPayments,
        ],
      ),
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

class SimpleTile extends StatelessWidget {
  const SimpleTile({
    super.key,
    required this.parameter,
    required this.value,
  });
  final String parameter;
  final String value;

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
        weight: FontWeight.w400,
        fontsize: 16,
      ),
    );
  }
}
