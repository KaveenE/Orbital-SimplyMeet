import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderWrapper extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> childrenInColumn;
  final Key formKey;
  const FormBuilderWrapper({
    required this.formKey,
    required this.childrenInColumn,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });
  @override
  Widget build(BuildContext context) {
    
    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisAlignment: this.mainAxisAlignment,
        mainAxisSize: this.mainAxisSize,
        crossAxisAlignment: this.crossAxisAlignment,
        children: this.childrenInColumn,
      ),
    );
  }
}
