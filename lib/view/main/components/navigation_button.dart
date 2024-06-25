import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final Function(Offset) onTap;
  final String text;

  const NavigationTextButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final RenderBox buttonBox = context.findRenderObject() as RenderBox;
        final Offset buttonPosition = buttonBox.localToGlobal(Offset.zero);
        onTap(buttonPosition);
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 5, 5, 5),
              fontSize: 16,
            ),
      ),
    );
  }
}
