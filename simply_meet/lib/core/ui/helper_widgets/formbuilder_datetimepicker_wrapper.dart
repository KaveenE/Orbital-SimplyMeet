import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class FormBuilderDateTimePickerWrapper extends StatelessWidget {
  final String name;
  final String wordBelowIcon;
  final DateTime currTime;
  final DateTime initialValue;
  final TextStyle? textStyle;
  final InputDecoration? decoration;

  const FormBuilderDateTimePickerWrapper({
    required this.currTime,
    required this.name,
    this.wordBelowIcon = '',
    required this.initialValue,
    this.textStyle,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: this.name,
      format: DateFormat("d/M/y").add_jm(),
      initialValue: this.initialValue,
      maxLines: 2,
      validator: FormBuilderValidators.required(context,
          errorText: "Field cannot be empty"),
      firstDate: this.currTime,
      lastDate: this.currTime.add(
            Duration(days: 365),
          ),
      style: textStyle,
      decoration: decoration ?? InputDecoration(
        border: InputBorder.none,
        hintText: "Choose Date",
        hintStyle: TextStyle(height: 2),
        contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
        prefixIcon: Column(
          children: [
            Icon(
              Icons.calendar_today_rounded,
              color: Colors.grey.shade700,
            ),
            Text(this.wordBelowIcon),
          ],
        ),
      ),
    );
  }
}
