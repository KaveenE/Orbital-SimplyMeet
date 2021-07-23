import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                "Pick a color to highlight cell",
                softWrap: true,
                style: TextStyle(
                  fontSize: 20,
                  color: theme(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlockPicker(
              pickerColor: initialColor,
              onColorChanged: (currColor) {
                changeColor(currColor);
                inputField.didChange(currColor);
              },
              availableColors: [
                Colors.red.shade400,
                Colors.pink.shade300,
                Colors.purple.shade300,
                Colors.deepPurple.shade300,
                Colors.indigo.shade300,
                Colors.blue.shade300,
                Colors.lightBlue.shade300,
                Colors.cyan.shade300,
                Colors.teal.shade300,
                Colors.green.shade300,
                Colors.lightGreen.shade300,
                Colors.lime.shade300,
                Colors.yellow.shade300,
                Colors.amber.shade300,
                Colors.orange.shade300,
                Colors.deepOrange.shade300,
                Colors.brown.shade300,
                Colors.grey.shade300,
                Colors.blueGrey.shade300,
                Colors.grey.shade600,
              ],
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
