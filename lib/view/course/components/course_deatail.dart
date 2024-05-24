import 'package:cenem/view/course/components/cost.dart';

import 'package:cenem/view/custom%20componant/custom_button.dart';

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
          Text(
            courseList[index].description,
            style: const TextStyle(color: Colors.grey, height: 1.5),
            maxLines: size.width > 700 && size.width < 750
                ? 3
                : size.width < 470
                    ? 4
                    : size.width > 600 && size.width < 700
                        ? 6
                        : size.width > 900 && size.width < 1060
                            ? 6
                            : 4,
            overflow: TextOverflow.ellipsis,
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
