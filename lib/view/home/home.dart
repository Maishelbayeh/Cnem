
import 'package:flutter/material.dart';

import 'package:cenem/view/intro/introduction.dart';
import 'package:cenem/view/main/main_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainView(pages: [
       Introduction(),
      //Certifications(),
      // CoursesView(),
      // const AboutUS(),
    ]);
  }
}
