import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/view_models/login_signup_view_model.dart';

class FormBuilderPassword extends StatelessWidget {
  final String hintText;
  final String identifierForField;

  const FormBuilderPassword({
    required this.identifierForField,
    this.hintText = "Password",
  });

  @override
  Widget build(BuildContext context) {
    final loginSignUpViewModel = Provider.of<LoginSignUpViewModel>(context);

    // final FormFieldValidator<String> passwordRequirement =
    //     FormBuilderValidators.match(context,
    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    //         errorText:
    //             "Password must be at least 8 characters with mixture of\n1) Uppercase and lowercase letters\n2) Numbers\n3) Special case symbols except < and >");

    return FormBuilderTextField(
      name: identifierForField,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: FormBuilderValidators.compose([
      //   passwordRequirement,
      //   (reenteredPassword) {
      //     if (globalFormKey!= null && reenteredPassword !=
      //     loginSignUpViewModel.globalFormKeyList[1].currentState!.fields[identifierForField]!.value) {
      //       return "Password entries are not the same";
      //     }
      //     return null;
      //   }
      // ]),
      textInputAction: this.hintText.compareTo("Password") == 0
          ? TextInputAction.next
          : TextInputAction.done,
      obscureText: loginSignUpViewModel.hidePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.06),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme(context).accentColor,
        hintText: this.hintText,
        hintStyle: TextStyle(
          color: theme(context).primaryColor.withOpacity(0.7),
        ),
        contentPadding: EdgeInsets.only(left: screenWidth(context) * 0.06),
        errorMaxLines: 3,
        prefixIcon: Icon(
          Icons.lock_outlined,
          color: theme(context).primaryColor,
        ),
        suffixIcon: IconButton(
          onPressed: () => loginSignUpViewModel.toggleVisibility(),
          color: theme(context).primaryColor,
          icon: Icon(
            loginSignUpViewModel.hidePassword
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
