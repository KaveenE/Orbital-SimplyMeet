import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderEmail extends StatelessWidget {
  const FormBuilderEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FormBuilderTextField(
      name: "email",
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context,
            errorText: "Email Address cannot be empty"),
        FormBuilderValidators.email(context,
            errorText: "Not a valid email address")
      ]),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenSize.width * 0.06),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xffCDC6DE),
        hintText: "Email Address",
        contentPadding: EdgeInsets.only(left: screenSize.width * 0.06),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}



