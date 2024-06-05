import 'package:cenem/view/custom%20componant/gradiantText.dart';
import 'package:cenem/view/user/helpers/reponsiveness.dart';
import 'package:cenem/view/user/widgets/vertical_menu_item.dart';
import 'package:cenem/view/user/widgets/horizontal_menu_item.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final TextWithGradient itemName;

  const SideMenuItem({Key? key, required this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context)) {
      return VertticalMenuItem(
        itemName: itemName,
      );
    } else {
      return HorizontalMenuItem(
        itemName: itemName,
      );
    }
  }
}
