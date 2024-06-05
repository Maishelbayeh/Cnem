import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:flutter/material.dart';

class RevenueInfo extends StatelessWidget {
  final String? title;
  final int? amount;

  const RevenueInfo({Key? key, this.title, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            textDirection:
                TextDirection.rtl, // Set text direction to right-to-left
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title \n\n",
                  style: const TextStyle(color: lightGrey, fontSize: 16),
                ),
                TextSpan(
                  text: "\$ $amount",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 10), // Add some space between the RichText and the button
          CustomButton(
            onTap: () {},
            buttonText: title ?? '',
            width: 150,
            height: 45,
          ),
        ],
      ),
    );
  }
}
