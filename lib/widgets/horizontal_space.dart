import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({super.key, required this.space});
  final double space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
