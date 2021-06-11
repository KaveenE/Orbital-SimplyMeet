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
      // validator: FormBuilderValidators.match(context,
      //     r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$',
      //     errorText:
      //         "1) Username must contain 8 - 20 characters\n2) No _ or . next to each other, start, end\n3) No _ or .  multiple times in a row"),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.06),
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 3,
        filled: true,
        fillColor: const Color(0xffCDC6DE),
        hintText: "Username",
        contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
        prefixIcon: Icon(
          Icons.account_circle_outlined,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
