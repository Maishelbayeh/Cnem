import 'package:cenem/view/user/main/components/TopNavMember.dart';
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
          title: "عدد العملاء الذين لم يمر على اشتراكهم شهر",
          value: member.numberOfUserChildren.toString(),
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "عدد عملائك الملتزمين بتجديد الاشتراك",
          value: member.numberofMemberChildren.toString(),
          topColor: Colors.lightGreen,
          onTap: () {},
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "عدد عملائك الذين تم الغاؤهم",
          value: member.numberOfDeletedChildren.toString(),
          topColor: Colors.redAccent,
          onTap: () {},
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "تاريخ اخر تجديد للاشتراك",
          value: '12-06-2024',
          onTap: () {},
        ),
      ],
    );
  }
}
