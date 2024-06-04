import 'package:cenem/view/user/pages/overview/widgets/info_card.dart';
import 'package:flutter/material.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        InfoCard(
          title: "",
          value: "7",
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "",
          value: "17",
          topColor: Colors.lightGreen,
          onTap: () {},
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "",
          value: "3",
          topColor: Colors.redAccent,
          onTap: () {},
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "",
          value: "32",
          onTap: () {},
        ),
      ],
    );
  }
}
