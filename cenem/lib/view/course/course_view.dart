import 'package:flutter/material.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view%20model/getx_controllers/courses_controller.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/course/components/title_text.dart';
import 'package:get/get.dart';
import 'components/course_grid.dart';

class CoursesView extends StatelessWidget {
  CoursesView({super.key});
  final controller = Get.put(CourseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: 'Our', title: 'Courses'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Responsive(
                  desktop: CourseGrid(
                    crossAxisCount: 3,
                  ),
                  extraLargeScreen: CourseGrid(crossAxisCount: 4, ratio: 0.8),
                  largeMobile: CourseGrid(crossAxisCount: 1, ratio: 1.0),
                  mobile: CourseGrid(crossAxisCount: 1, ratio: 1.0),
                  tablet: CourseGrid(
                    ratio: 0.9,
                    crossAxisCount: 2,
                  )))
        ],
      ),
    );
  }
}
