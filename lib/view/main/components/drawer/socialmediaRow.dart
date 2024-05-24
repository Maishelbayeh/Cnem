import 'package:flutter/material.dart';
import 'package:cenem/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconRow extends StatelessWidget {
  const SocialMediaIconRow({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialMediaIcon(
          icon: 'assets/icons/linkedin.svg',
          onTap: () =>
              launchUrl(Uri.parse('https://www.linkedin.com/in/hamad-anwar/')),
        ),
        const SizedBox(width: 16), // Add space between icons
        SocialMediaIcon(
          icon: 'assets/icons/github.svg',
          onTap: () => launchUrl(Uri.parse('https://github.com/Hamad-Anwar')),
        ),
      ],
    );
  }
}
