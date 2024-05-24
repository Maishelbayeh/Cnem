import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/constants.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.icon, this.onTap});
  final String icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 0.4),
        child: SvgPicture.asset(
          icon,
          color: const Color.fromARGB(255, 11, 11, 11),
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
