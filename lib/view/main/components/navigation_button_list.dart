import 'package:cenem/view/custom%20componant/popUpmenue.dart';
import 'package:flutter/material.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomPopupMenuButton customPopupMenuButton = CustomPopupMenuButton();
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                NavigationTextButton(
                    onTap: (buttonPosition) {
                      customPopupMenuButton.showCustomPopupMenu(
                          context, buttonPosition);
                    },
                    text: 'من نحن'),
                NavigationTextButton(
                  onTap: (buttonPosition) {
                    customPopupMenuButton.showCustomPopupMenu(
                        context, buttonPosition);
                  },
                  text: 'فكرة الشبكه',
                ),
                NavigationTextButton(
                  onTap: (buttonPosition) {
                    customPopupMenuButton.showCustomPopupMenu(
                        context, buttonPosition);
                  },
                  text: 'اتصل بنا',
                ),
                // NavigationTextButton(onTap: () {}, text: 'Achievements'),
              ],
            ),
          ),
        );
      },
    );
  }
}
