<<<<<<< HEAD
import 'package:cenem/model/user_model.dart';
=======
import 'package:cenem/model/member_model.dart';
>>>>>>> origin/gh-pages
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:cenem/view/user/main/components/TopNavMember.dart';
import 'package:cenem/view/user/pages/overview/widgets/revenue_info.dart';
import 'package:cenem/view/user/widgets/custom_text.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_web_dashboard/pages/overview/widgets/bar_chart.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWithGradient(start: 15, end: 20, text: "المحفظة..")
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    RevenueInfo(title: "المبلغ الشهري", amount: member.MPC),
                    RevenueInfo(
                      title: "المبلغ المستحق",
                      amount: member.MPP,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                // Row(
                //   children: [
                //     RevenueInfo(
                //       title: "Last 30 days",
                //       amount: "3,230",
                //     ),
                //     RevenueInfo(
                //       title: "Last 12 months",
                //       amount: "11,300",
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
