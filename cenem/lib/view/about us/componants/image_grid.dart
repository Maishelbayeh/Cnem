import 'package:cenem/model/AboutUS_model.dart';
import 'package:cenem/view/about%20us/componants/contactForm.dart';
import 'package:cenem/view/about%20us/componants/imageInfo.dart';
import 'package:cenem/view/main/components/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';

class UserImageContainerWrapper extends StatefulWidget {
  final double height;
  final double width;
  final double space;

  const UserImageContainerWrapper({
    Key? key,
    required this.height,
    required this.width,
    required this.space,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserImageContainerWrapperState createState() =>
      _UserImageContainerWrapperState();
}

class _UserImageContainerWrapperState extends State<UserImageContainerWrapper> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Wrap with Center widget
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
          children: List.generate(AdmisList.length, (index) {
            // Add horizontal space between items using Padding widget
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.space),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center vertically
                children: [
                  UserImageContainerItem(
                    index: index,
                    height: widget.height,
                    width: widget.width,
                  ),
                  const SizedBox(
                    height: 10,
                  ), // Add vertical space between items
                  ColoredText(
                    start: 20,
                    end: 25,
                    text: AdmisList[index].description,
                    gradient: true,
                  ),
                  //   ContactForm(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}