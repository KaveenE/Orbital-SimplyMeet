import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class FormBuilderUserName extends StatelessWidget {
  const FormBuilderUserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "username",
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.06),
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 3,
        filled: true,
        fillColor: theme(context).accentColor,
        hintText: "Username",
        hintStyle: TextStyle(
          color: theme(context).primaryColor.withOpacity(0.7),
        ),
        contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
        prefixIcon: Icon(
          Icons.account_circle_outlined,
          color: theme(context).primaryColor,
        ),
      ),
    );
  }
}
