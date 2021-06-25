import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderDropdownWrapper extends StatelessWidget {
  final List<DropdownMenuItem<String>> dropdownMenu;
  final String initialValue;
  final String name;
  final String hintText;

  final Icon? icon;
  final double iconSize;
  final Color? iconEnabledColor;

  final InputDecoration? decoration;
  final TextStyle? style;

  const FormBuilderDropdownWrapper({
    required this.dropdownMenu,
    required this.initialValue,
    required this.hintText,
    required this.name,
    this.icon,
    this.iconSize = 24,
    this.decoration,
    this.iconEnabledColor,
    this.style,
  });

  String stripPrefix() {
    if (initialValue.contains("ONE-TIME")) {
      return "ONE-TIME";
    } else if (initialValue.contains("DAILY")) {
      return "DAILY";
    } else if (initialValue.contains("WEEKLY")) {
      return "WEEKLY";
    } else if (initialValue.contains("MONTHLY")) {
      return "MONTHLY";
    } else {
      return "YEARLY";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      icon: this.icon,
      iconSize: this.iconSize,
      iconEnabledColor: this.iconEnabledColor,
      name: this.name,
      initialValue: name.contains("recur") ? stripPrefix() : initialValue,
      items: dropdownMenu,
      style: this.style,
      decoration: decoration ?? InputDecoration(
        border: InputBorder.none,
        labelText: "Recurrence Pattern",
      ),
      hint: Text(hintText),
    );
  }
}
