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
  final BuildContext context;

  FormBuilderTextFieldWrapper({
    required this.name,
    required this.hintText,
    required this.keyboardType,
    required this.context,
    required this.initialValue,
    this.textInputAction,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final isSubjectField = name.contains("sub");
    return FormBuilderTextField(
      name: this.name,
      initialValue: this.initialValue,
      keyboardType: this.keyboardType,
      textInputAction: this.textInputAction ?? TextInputAction.next,
      decoration: this.decoration ??
          InputDecoration(
            border: InputBorder.none,
            hintText: this.hintText,
            hintStyle: TextStyle(height: 2.2),
            contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
            prefixIcon: Icon(
              isSubjectField ? Icons.short_text_rounded : Icons.subject_rounded,
              color: Colors.grey.shade700,
            ),
          ),
      maxLines: isSubjectField ? 2 : 5,
    );
  }
}
