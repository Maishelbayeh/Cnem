import 'package:cenem/model/AboutUS_model.dart';
import 'package:cenem/res/constants.dart';
import 'package:cenem/view/about%20us/componants/Icon.dart';
import 'package:cenem/view/about%20us/componants/contactForm.dart';
import 'package:cenem/view/main/components/subtitle_text.dart';
import 'package:flutter/material.dart';

class UserImageContainerItem extends StatefulWidget {
  final int index;
  final double height;
  final double width;

  const UserImageContainerItem({
    Key? key,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _UserImageContainerItemState createState() => _UserImageContainerItemState();
}

class _UserImageContainerItemState extends State<UserImageContainerItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const ColoredText(
                  start: 20,
                  end: 25,
                  text: 'تواصل معنا',
                  gradient: true,
                ),
                content: const CustomForm(),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('اغلاق'),
                  ),
                ],
              );
            },
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${AdmisList[widget.index].name} tapped!')),
          );
        },
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding:
                EdgeInsets.all(_isHovered ? 12 : 8), // Change padding on hover
            margin: const EdgeInsets.symmetric(
                horizontal: 8.0), // Add margin between items
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _isHovered
                  ? Colors.grey[300]
                  : bgColor, // Change color on hover
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      )
                    ]
                  : [],
            ),
            child: UserImageContainer(
              height: widget.height,
              width: widget.width,
              imagePath: AdmisList[widget.index].image,
            ),
          ),
        ),
      ),
    );
  }
}
