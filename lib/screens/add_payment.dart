// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:splitbliss/screens/payment_history.dart';
import 'package:splitbliss/widgets/radio_button.dart';
import 'package:splitbliss/widgets/text_inter.dart';

import '../colors.dart';
import '../widgets/bottom_button.dart';
import '../widgets/input_container.dart';
import '../widgets/title_bar.dart';

class AddPayment extends StatelessWidget {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.Surface94,
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
  List<Map<String, dynamic>> members = [];
  List<String> persons = [
    "vinay3",
    "chiru",
    "siva23",
    "samuel12",
    "nagasai234"
  ];
  List<String> inPayment = [];
  String selectedOption = options[0];
  TextEditingController amountController = TextEditingController();
  TextEditingController paidByController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  @override
  void dispose() {
    amountController.dispose();
    paidByController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 5; i++) {
      RandomColor _randomColor = RandomColor();
      Color backgroundColor = _randomColor.randomColor(
        colorBrightness: ColorBrightness.dark,
      );
      members
          .add({'name': persons[i], 'color': backgroundColor.withAlpha(200)});
    }
  }

  void setSelectedOption(String? value) {
    if (value == options[1]) {
      inPayment = [...persons];
    }
    setState(() {
      selectedOption = value.toString();
    });
  }

  void toggle(String value) {
    if (inPayment.contains(value)) {
      setState(() {
        inPayment.remove(value);
      });
    } else {
      setState(() {
        inPayment.add(value);
      });
    }
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
              if (selectedOption == options[0])
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    for (var person in members)
                      ToggleMembers(
                          user: person['name'],
                          color: person['color'],
                          onTap: toggle,
                          has: inPayment.contains(person['name']))
                  ],
                )
            ],
          ),
          BottomButton(
            color: appColors.primary,
            title: "Add Payment",
            onPress: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return PaymentHistory();
              }));
            },
          )
        ],
      ),
    );
  }
}

class ToggleMembers extends StatelessWidget {
  const ToggleMembers(
      {super.key,
      required this.color,
      required this.user,
      required this.onTap,
      required this.has});
  final Color color;
  final String user;
  final bool has;
  final void Function(String value) onTap;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        onTap(user);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color),
          color: (has) ? color : appColors.Surface94,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextInter(
          title: user,
          fontsize: 14,
        ),
      ),
    );
  }
}
