import 'package:cenem/view/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view/certifications/certifications.dart';
import 'package:cenem/view/main/main_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainView(pages: [
      
    
      Certifications(),
      Footer(),
    ]);
  }
}
