import 'package:flutter/material.dart';

import '../../res/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final double height;
  final double width;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.height = 60.0,
    this.width = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 1, 86),
                Colors.blue.shade900,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(0, -1),
                blurRadius: defaultPadding / 4,
              ),
              BoxShadow(
                color: Colors.red,
                offset: Offset(0, 1),
                blurRadius: defaultPadding / 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Icon(FontAwesomeIcons.whatsapp,color: Colors.greenAccent,size: 15,),
              const SizedBox(width: defaultPadding / 4),
              Text(
                buttonText,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
