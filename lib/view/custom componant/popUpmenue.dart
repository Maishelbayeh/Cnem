import 'package:cenem/view%20model/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPopupMenuButton {
  void showCustomPopupMenu(BuildContext context, Offset buttonPosition) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + 40,
        overlay.size.width - buttonPosition.dx,
        overlay.size.height - buttonPosition.dy,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'https://whatsapp.com/channel/0029VaawoizIHphDlzrBWX1I',
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.whatsapp,
                color: Color.fromARGB(
                    255, 5, 137, 73), // Customize the icon color here
              ),
              SizedBox(width: 10), // Adjust spacing between icon and text
              Text(
                'تواصل معنا عبر',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 137, 73),
                  fontSize: Responsive.isMobile(context) ? 15 : 20,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'https://t.me/+dcwDj7c6bYcyOTNk',
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.telegram,
                color: Color.fromARGB(
                    255, 105, 175, 240), // Customize the icon color here
              ),
              const SizedBox(width: 10), // Adjust spacing between icon and text
              Text(
                'تواصل معنا عبر',
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 175, 240),
                  fontSize: Responsive.isMobile(context) ? 15 : 20,
                ),
              ),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        launchUrl(Uri.parse(value));
      }
    });
  }
}
