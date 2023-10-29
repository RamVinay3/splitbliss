import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/elevated_container.dart';
import 'package:splitbliss/widgets/radio_button.dart';
import 'package:splitbliss/widgets/svg.dart';
import 'package:splitbliss/widgets/text_roboto.dart';

class PollCard extends StatefulWidget {
  const PollCard({
    super.key,
    required this.question,
    required this.option1,
    required this.option2,
    required this.options,
  });
  final String question;
  final List<String> options;
  final List<String> option1;
  final List<String> option2;
  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  var selectedOption = '';
  var show = false;
  Widget build(BuildContext context) {
    return ElevatedContainer(
      padding: 25,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextRoboto(
              title: widget.question,
              fontsize: 16,
              weight: FontWeight.w500,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    show = !show;
                  });
                },
                child: SVG(svgPath: 'lib/svg/showInfo.svg'))
          ],
        ),
        SizedBox(height: 10),
        for (var option in widget.options)
          RadioButton(
            value: option,
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),
        if (show && widget.option1.length != 0)
          TextRoboto(
            title: 'Option 1',
            fontsize: 16,
            weight: FontWeight.w500,
          ),
        if (show && widget.option1.length != 0) SizedBox(height: 10),
        if (show && widget.option1.length != 0)
          for (var person in widget.option1)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextRoboto(
                    title: person,
                    fontsize: 16,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
        if (show && widget.option2.length != 0)
          TextRoboto(
            title: 'Option 2',
            fontsize: 16,
            weight: FontWeight.w500,
          ),
        if (show && widget.option2.length != 0) SizedBox(height: 10),
        if (show && widget.option2.length != 0)
          for (var person in widget.option2)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextRoboto(
                    title: person,
                    fontsize: 16,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
      ],
    );
  }
}
