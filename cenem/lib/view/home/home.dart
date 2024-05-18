import 'package:cenem/view/about%20us/AboutUs.dart';
import 'package:cenem/view/video/video.dart';
import 'package:flutter/material.dart';

import 'package:cenem/view/intro/introduction.dart';
import 'package:cenem/view/main/main_view.dart';
import 'package:cenem/view/course/course_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(pages: [
      const Introduction(),
      Certifications(),
      CoursesView(),
      const AboutUS(),
    ]);
  }
}
