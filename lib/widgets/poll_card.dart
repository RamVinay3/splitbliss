import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/radio_button.dart';

class PollCard extends StatefulWidget {
  const PollCard({super.key});

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  List<String> options = [
    'Chicken',
    'Mutton',
  ];
  String selectedOption = "";
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("What should we cook today?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              RadioButton(
                value: options[0],
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                  });
                },
              ),
              RadioButton(
                value: options[1],
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                  });
                },
              ),
              Text("Option 1",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              // SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Samuel"),
                      SizedBox(height: 5),
                      Text("Vinay"),
                      SizedBox(height: 5),
                      Text("Sai"),
                    ],
                  )),
              Text("Option 2",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Chiru"),
                      SizedBox(height: 5),
                      Text("Shiva"),
                    ],
                  ))
            ],
          )),
    );
  }
}
