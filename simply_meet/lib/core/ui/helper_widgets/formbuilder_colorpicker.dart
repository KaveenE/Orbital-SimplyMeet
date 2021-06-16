import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';

class FormBuilderColorPicker extends StatelessWidget {
  final Color initialColor;
  final void Function(Color) changeColor;

  const FormBuilderColorPicker(
      {required this.initialColor, required this.changeColor});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: "color",
      initialValue: initialColor,
      builder: (FormFieldState<Color?> field) => OutlinedButton.icon(
        onPressed: () => DialogManager.singleton.colorPickerDialog(
          context: context,
          initialColor: initialColor,
          changeColor: changeColor,
          inputField: field,
        )..show(),
        icon: Icon(
          Icons.color_lens,
          color: initialColor,
        ),
        label: Text(
          "Choose highlight color",
          style: TextStyle(
            color: initialColor,
          ),
        ),
      ),
    );
  }
}
