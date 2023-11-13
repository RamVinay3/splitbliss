import 'package:flutter/material.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/utils.dart';
import 'package:splitbliss/widgets/elevated_container.dart';
import 'package:splitbliss/widgets/text_inter.dart';

class MemberTab extends StatefulWidget {
  MemberTab({super.key, required this.room});

  final Map<String, dynamic> room;
  // = {
  //   'admin': 'chiru25',
  //   'setamount': 1000,
  //   'spents': 3000,
  //   'balance': 7000,
  //   'totalMoney': 10000,
  //   'individualMoney': 1000,
  //   'members': ['Chiranjeevi', 'Vinay', 'Samuel', 'Nagasai', 'Siva Kiran'],
  //   'personalBalance': {
  //     'Vinay': 50,
  //     'Chiranjeevi': 200,
  //     'Nagasai': 500,
  //     'Samuel': -10000,
  //     'Siva Kiran': 500
  //   },
  //   'Members yet to Contribute': {
  //     'Vinay': 900,
  //     'Chiranjeevi': 700,
  //     'Nagasai': 500,
  //     'Samuel': 1000,
  //     'Siva Kiran': 500
  //   },
  //   'makePayments': {'vinay': 900, 'chiranjeevi': 20, 'Nagasai': 100}
  // };

  @override
  State<MemberTab> createState() => _MemberTabState();
}

class _MemberTabState extends State<MemberTab> {
  bool admin = false;
  String username = 'Vinay';
  @override
  void initState() {
    super.initState();
    admin = widget.room['admin'] == userName;
  }

  @override
  Widget build(BuildContext context) {
    bool inRemainder = widget.room['remainders']
        .where((value) => value['memberName'] == userName)
        .isNotEmpty;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MemberBalances(width),
          if ((admin && widget.room['remainders'].length != 0) ||
              (!admin && inRemainder))
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextInter(
                title: (admin) ? 'Members Yet To Contribute' : 'Remainder',
                weight: FontWeight.w500,
              ),
            ),
          if ((admin && widget.room['remainders'].length != 0) ||
              (!admin && inRemainder))
            ElevatedContainer(
              padding: 15,
              children: [
                // if (admin &&
                //     widget.room['Members yet to Contribute'].length != 0)
                for (var member in widget.room['remainders'])
                  if (admin || member['memberName'] == userName)
                    Container(
                      // color: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextInter(title: member['memberName']),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextInter(
                              title: widget.room['individualMoney'].toString(),
                              fontsize: 15,
                              alignment: TextAlign.right,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  if (admin) {
                                    print('approved the payment');
                                  } else {
                                    // we have to show pending status after clicking
                                    //think to implement
                                    print('changed to pending');
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (admin)
                                        ? appColors.profit
                                        : appColors.paymentRed,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 5),
                                  child: TextInter(
                                    title: (admin)
                                        ? 'Confirm Payment'
                                        : 'Confirm My Payment',
                                    fontsize: 10,
                                    color:
                                        (admin) ? Colors.white : Colors.black,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
              ],
            )
        ],
      ),
    );
  }

  ElevatedContainer MemberBalances(double width) {
    return ElevatedContainer(
      padding: 15,
      children: [
        for (var member in widget.room['members'])
          Container(
            // color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextInter(title: member['memberName']),
                ),
                Container(
                  width: 0.2 * width,
                  // color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextInter(
                      title: widget.room['individualMoney'].toString(),
                      fontsize: 15,
                      alignment: TextAlign.right),
                ),
                Expanded(
                  child: TextInter(
                      title: member['balance'].toString(),
                      color: member['balance'] > 0
                          ? appColors.profit
                          : appColors.loss,
                      alignment: TextAlign.right),
                ),
              ],
            ),
          )
      ],
    );
  }
}
