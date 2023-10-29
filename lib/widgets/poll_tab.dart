import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/poll_card.dart';
import 'package:splitbliss/widgets/svg.dart';

class PollTab extends StatelessWidget {
  const PollTab({super.key});
  static const List<Map<String, dynamic>> polls = [];
  // [
  //   {
  //     'question': 'What should we cook today?',
  //     'options': ['Chicken', 'Mutton'],
  //     'option1': ['vinay', 'chiru'],
  //     'option2': ['samuel', 'siva', 'nagasai']
  //   },
  //   {
  //     'question': 'What should we cook today?',
  //     'options': ['Chicken', 'Mutton'],
  //     'option1': ['vinay', 'chiru'],
  //     'option2': ['samuel', 'siva', 'nagasai']
  //   },
  //   {
  //     'question': 'What should we cook today?',
  //     'options': ['Chicken', 'Mutton'],
  //     'option1': ['vinay', 'chiru'],
  //     'option2': ['samuel', 'siva', 'nagasai']
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      child: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SVG(svgPath: "lib/svg/pollIcon.svg"),
          SizedBox(height: 10),
          Text("Create a Poll\n know the opinions",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF606060))),
        ],
      )),
    );
    if (polls.isNotEmpty) {
      content = ListView.builder(
        itemCount: polls.length,
        itemBuilder: ((context, index) {
          var poll = polls[index];
          return PollCard(
            option1: poll['option1'],
            option2: poll['option2'],
            options: poll['options'],
            question: poll['question'],
          );
        }),
      );
    }

    return content;
  }
}
