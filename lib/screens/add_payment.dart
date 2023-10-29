// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/radio_button.dart';
import 'package:splitbliss/widgets/user_card.dart';

import '../widgets/bottom_button.dart';
import '../widgets/input_container.dart';
import '../widgets/search_container.dart';
import '../widgets/title_bar.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TitleBar(title: "Add Payment"),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

List<String> options = [
  'Spent On Some',
  'Spent On All',
];

List<String> users = [];

class _BodyState extends State<Body> {
  String selectedOption = options[0];
  TextEditingController amountController = TextEditingController();
  TextEditingController paidByController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    amountController.dispose();
    paidByController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  void setSelectedOption(String? value) {
    setState(() {
      selectedOption = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InputContainer(
                  hint: 'Amount',
                  keyboardType: TextInputType.number,
                  roomNameController: amountController),
              SizedBox(height: 20),
              InputContainer(
                  hint: 'Paid By',
                  keyboardType: TextInputType.text,
                  roomNameController: paidByController),
              SizedBox(height: 20),
              InputContainer(
                  hint: 'Reason',
                  keyboardType: TextInputType.text,
                  roomNameController: reasonController),
              SizedBox(height: 20),
              Row(
                children: [
                  RadioButton(
                      value: options[0],
                      groupValue: selectedOption,
                      onChanged: setSelectedOption),
                  SizedBox(width: 20),
                  RadioButton(
                      value: options[1],
                      groupValue: selectedOption,
                      onChanged: setSelectedOption),
                ],
              ),
              SizedBox(height: 20),
              SearchContainer(
                  onPress: () {}, searchController: searchController),
              SizedBox(height: 20),
              Wrap(
                spacing: 5,
                runSpacing: 10,
                children: [
                  UserCard(
                    user: "@Vinay3",
                    color: Color.fromARGB(255, 215, 140, 239),
                    onPress: (String value) {},
                  ),
                ],
              )
            ],
          ),
          BottomButton(
            title: "Add Payment",
            onPress: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
