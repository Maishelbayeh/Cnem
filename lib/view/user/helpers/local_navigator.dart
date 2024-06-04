import 'package:cenem/res/controllers.dart';
import 'package:cenem/view/user/routing/router.dart';
import 'package:cenem/view/user/routing/routes.dart';
import 'package:flutter/cupertino.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
