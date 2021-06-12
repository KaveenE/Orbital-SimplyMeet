import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/services/flutterfire/authentication_service.dart';
import 'package:simply_meet/shared/models/custom_exception.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgetPasswordViewModel {
  final GlobalKey<FormBuilderState> _formKey;
  final BuildContext _context;
  ForgetPasswordViewModel(this._formKey, this._context);

  Future<void> resetPassword() async {
    if (!_validateAllFieldsNonEmpty(
        context: _context,
        formKey: _formKey,
        titleForDialog: "Unable to change password")) return;

    final email = _formKey.currentState!.fields["email"]!.value as String;
    //final password = _formKey.currentState!.fields["password"]!.value as String;

    final response =
        await Provider.of<AuthenticationService>(_context, listen: false)
            .sendPasswordResetEmail(email: email);

    if (response != null) {
      DialogManager.singleton.defaultErrorDialog(
        title: "Unable to change password",
        description: response,
        context: _context,
      )..show();
    } else {
      showTopSnackBar(
        _context,
        CustomSnackBar.error(
          message: "A password link has been sent to $email",
          backgroundColor: Colors.amber,
        ),
      );
      Timer(Duration(seconds: 1), () => Navigator.of(_context).pop());
      ;
    }
    //TODO: Implement confirmPasswordReset?
    //_fireBaseAuth.confirmPasswordReset(code: code, newPassword: newPassword)
  }

  bool _validateAllFieldsNonEmpty(
      {required GlobalKey<FormBuilderState> formKey,
      required String titleForDialog,
      required BuildContext context}) {
    try {
      for (final value in formKey.currentState!.fields.values) {
        if (value.value == null || value.value.isEmpty) {
          throw AllFieldsNotFilledException(
              message: "Input fields must not be empty.");
        }
      }
    } on AllFieldsNotFilledException catch (e) {
      DialogManager.singleton.defaultErrorDialog(
          title: titleForDialog, description: e.message, context: context)
        ..show();
      return false;
    }

    return true;
  }
}
