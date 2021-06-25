import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DialogManager {
  static final DialogManager _singleton = DialogManager._();
  static DialogManager get singleton => _singleton;
  DialogManager._();

  AwesomeDialog defaultErrorDialog({
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      title: title,
      desc: description,
      btnOkOnPress: () {},
      btnOkIcon: Icons.cancel,
      btnOkColor: Colors.red,
      btnOkText: "OK",
    );
  }

  AwesomeDialog defaultSuccessDialog({
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      title: title,
      desc: description,
      btnOkOnPress: () {},
      btnOkColor: Colors.green,
      btnOkIcon: Icons.check_circle,
      btnOkText: "OK",
    );
  }

  AwesomeDialog colorPickerDialog({
    required BuildContext context,
    required Color initialColor,
    required void Function(Color color) changeColor,
    required FormFieldState<Color?> inputField,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Pick a color to highlight cell",
              softWrap: true,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Divider(),
            BlockPicker(
              pickerColor: initialColor,
              onColorChanged: (currColor) {
                changeColor(currColor);
                inputField.didChange(currColor);
              },
            ),
          ],
        ),
      ),
      headerAnimationLoop: false,
      title: 'Select colors',
      btnOkOnPress: () {},
      btnOkIcon: Icons.color_lens_rounded,
      btnOkColor: initialColor,
      btnOkText: "OK",
    );
  }

  AwesomeDialog defaultConfirmationDialog({
    required String title,
    required String description,
    required BuildContext context,
    required Function confirmAction,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      title: title,
      desc: description,
      btnCancelOnPress: () {},
      btnCancelColor: Colors.red,
      btnCancelText: "CANCEL",
      btnOkOnPress: confirmAction,
      btnOkColor: Colors.green,
      btnOkText: "OK",
    );
  }
}
