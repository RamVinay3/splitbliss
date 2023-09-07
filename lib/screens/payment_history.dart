// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
      padding: EdgeInsets.all(20),
    );
  }
}
