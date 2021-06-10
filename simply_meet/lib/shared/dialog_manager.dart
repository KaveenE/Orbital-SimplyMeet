import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogManager {
  static final DialogManager singleton = DialogManager();

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
}
