import 'package:cenem/view/user/helpers/reponsiveness.dart';
import 'package:cenem/view/user/pages/overview/widgets/overview_cards_large.dart';
import 'package:cenem/view/user/pages/overview/widgets/overview_cards_medium.dart';
import 'package:cenem/view/user/pages/overview/widgets/overview_cards_small.dart';
import 'package:cenem/view/user/pages/overview/widgets/revenue_section_large.dart';
import 'package:cenem/view/user/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/revenue_section_small.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Obx(
        //   () => Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(
        //             top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: ListView(
            children: [
              const Spacer(flex: 6),
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  const OverviewCardsMediumScreen()
                else
                  const OverviewCardsLargeScreen()
              else
                const OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionLarge()
              else
                const RevenueSectionSmall(),
              //const AvailableDriversTable(),
            ],
          ),
        ),
      ],
    );
  }
}
