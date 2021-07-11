import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class FormBuilderEmail extends StatelessWidget {
  const FormBuilderEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "email",
      keyboardType: TextInputType.emailAddress,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: FormBuilderValidators.compose([
      //   FormBuilderValidators.required(context,
      //       errorText: "Email Address cannot be empty"),
      //   FormBuilderValidators.email(context,
      //       errorText: "Not a valid email address")
      // ]),
      autofillHints: [AutofillHints.email],
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.06),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme(context).accentColor,
        hintText: "Email Address",
        hintStyle: TextStyle(
          color: theme(context).primaryColor.withOpacity(0.7),
        ),
        contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
        prefixIcon: Icon(
          Icons.alternate_email,
          color: theme(context).primaryColor,
        ),
      ),
    );
  }
}
