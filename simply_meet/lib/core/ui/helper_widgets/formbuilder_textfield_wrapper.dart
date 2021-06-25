import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class FormBuilderTextFieldWrapper extends StatelessWidget {
  final String name;
  final String hintText;
  final String initialValue;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final BuildContext context;

  FormBuilderTextFieldWrapper({
    required this.name,
    required this.hintText,
    required this.keyboardType,
    required this.context,
    required this.initialValue,
    this.textInputAction,
    this.decoration,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isShortField = name.contains("sub") || name.contains("title");
    return FormBuilderTextField(
      name: this.name,
      initialValue: this.initialValue,
      keyboardType: this.keyboardType,
      textInputAction: this.textInputAction ?? TextInputAction.next,
      validator: isShortField ? FormBuilderValidators.required(context,errorText:'${name[0].toUpperCase()+name.substring(1,name.length)} must be non-empty' ) : null,
      style: textStyle,
      decoration: this.decoration ??
          InputDecoration(
            border: InputBorder.none,
            hintText: this.hintText,
            hintStyle: TextStyle(height: 2.2),
            contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
            prefixIcon: Icon(
              isShortField ? Icons.short_text_rounded : Icons.subject_rounded,
              color: Colors.grey.shade700,
            ),
          ),
      maxLines: isShortField ? 2 : 5,
    );
  }
}
