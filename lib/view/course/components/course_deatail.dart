import 'package:cenem/view/course/components/cost.dart';

import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/description_text.dart';

import 'package:flutter/material.dart';

import '../../../model/course_model.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class CourseDetail extends StatelessWidget {
  final int index;
  const CourseDetail({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              courseList[index].name,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Responsive.isMobile(context)
              ? const SizedBox(
                  height: defaultPadding * 0.9,
                )
              : const SizedBox(
                  height: defaultPadding,
                ),
          Responsive(
            desktop: AnimatedDescriptionText(
                start: 14, end: 15, text: courseList[index].description),
            largeMobile: AnimatedDescriptionText(
                start: 14, end: 12, text: courseList[index].description),
            mobile: AnimatedDescriptionText(
                start: 14, end: 12, text: courseList[index].description),
            tablet: AnimatedDescriptionText(
                start: 17, end: 14, text: courseList[index].description),
          ),
          Responsive.isMobile(context)
              ? const SizedBox(
                  height: defaultPadding * 0.9,
                )
              : const SizedBox(
                  height: defaultPadding,
                ),
          CostText(index: index),
          Responsive.isMobile(context)
              ? const SizedBox(
                  height: defaultPadding * 0.9,
                )
              : const SizedBox(
                  height: defaultPadding,
                ),
          // HoursText(index: index),
          const Spacer(),
          Center(
            child: CustomButton(
              width: Responsive.isDesktop(context)
                  ? 300
                  : Responsive.isLargeMobile(context)
                      ? 250
                      : Responsive.isMobile(context)
                          ? 200
                          : Responsive.isTablet(context)
                              ? 250
                              : 300, // Adjust button width based on screen size
              height: Responsive.isDesktop(context)
                  ? 50
                  : Responsive.isLargeMobile(context)
                      ? 40
                      : Responsive.isMobile(context)
                          ? 40
                          : Responsive.isTablet(context)
                              ? 50
                              : 50,
              onTap: () {},
              buttonText:
                  'اشترك مجانا', // Adjust button height based on screen size
            ),
          ),
          const SizedBox(
            height: defaultPadding * 0.9,
          ),
        ],
      ),
    );
  }
}
