import 'package:flutter/material.dart';
import 'package:cenem/view/certifications/certifications.dart';
import 'package:cenem/view/intro/introduction.dart';
import 'package:cenem/view/main/main_view.dart';
import 'package:cenem/view/projects/project_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(pages: [
      const Introduction(),
      ProjectsView(),
      Certifications(),
    ]);
  }
}
