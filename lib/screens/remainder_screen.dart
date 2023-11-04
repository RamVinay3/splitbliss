import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/check_payment_button.dart';
import 'package:splitbliss/widgets/elevated_container.dart';
import 'package:splitbliss/widgets/text_inter.dart';
import 'package:splitbliss/widgets/title_bar.dart';

import '../colors.dart';

class Remainder extends StatefulWidget {
  const Remainder({super.key});

  @override
  State<Remainder> createState() => _RemainderState();
}

class _RemainderState extends State<Remainder> {
  var requestSent = false;
  void toggleRequest() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('request was sent '),
    ));
  }

  final users = ['vinay', 'ram', 'roja'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.Surface94,
      appBar: TitleBar(title: 'Remainder'),
      body: ListView(children: [
        ElevatedContainer(children: [
          for (var name in users)
            ListTile(
              title: TextInter(title: name),
              trailing: PaymentButton(onTap: toggleRequest),
            )
        ]),
      ]),
    );
  }
}
