import 'package:flutter/material.dart';
import 'package:splitbliss/widgets/text_inter.dart';

import '../colors.dart';

class PaymentButton extends StatefulWidget {
  const PaymentButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  bool requestSent = false;
  void toggleRequest() {
    print(requestSent);
    if (!requestSent) {
      setState(() {
        requestSent = true;
      });

      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleRequest,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (requestSent) ? appColors.profit : appColors.paymentRed,
        ),
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        child: TextInter(
          title: (!requestSent) ? 'Request Payment' : 'sent Request',
          fontsize: 12,
          color: (requestSent) ? Colors.white : Colors.black,
          weight: FontWeight.w600,
        ),
      ),
    );
  }
}
