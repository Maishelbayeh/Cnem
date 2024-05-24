import 'package:flutter/material.dart';
import 'package:cenem/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          icon: 'assets/icons/whatsapp.svg',
          onTap: () => launchUrl(Uri.parse(
              'https://whatsapp.com/channel/0029VaawoizIHphDlzrBWX1I')),
        ),
        const SizedBox(width: 16), // Add space between icons
        SocialMediaIcon(
          icon: 'assets/icons/telegram.svg',
          onTap: () => launchUrl(Uri.parse('https://t.me/+dcwDj7c6bYcyOTNk')),
        ),
      ],
    );
  }
}
