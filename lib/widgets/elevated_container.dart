import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  const ElevatedContainer(
      {super.key, required this.children, this.padding = 10});
  final List<Widget> children;
  final int padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(padding.toDouble()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
