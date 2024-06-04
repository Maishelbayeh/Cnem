import 'package:cenem/view%20model/local_navigator.dart';
import 'package:cenem/view/user/helpers/reponsiveness.dart';
import 'package:cenem/view/user/widgets/large_screen.dart';
import 'package:cenem/view/user/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  SiteLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        // appBar:  topNavigationBar(context, scaffoldKey),

        body: ResponsiveWidget(largeScreen: const LargeScreen()));
  }
}
