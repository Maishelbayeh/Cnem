import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onSelected;

  CustomPopupMenuButton({required this.options, required this.onSelected});

  @override
  _CustomPopupMenuButtonState createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: _selectedOption,
      itemBuilder: (BuildContext context) {
        return widget.options.map((String option) {
          return PopupMenuItem(
            child: Text(option),
            value: option,
          );
        }).toList();
      },
      onSelected: (String value) {
        setState(() {
          _selectedOption = value;
        });
        widget.onSelected(value);
      },
    );
  }
}
