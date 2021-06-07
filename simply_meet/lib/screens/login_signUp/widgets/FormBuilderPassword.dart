import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderPassword extends StatelessWidget {
  final bool hidePassword;
  final void Function() onPress;
  final String hintText;
  final String identifierForField;
  final GlobalKey<FormBuilderState>? globalFormKey;

  const FormBuilderPassword({
    required this.onPress,
    required this.hidePassword,
    required this.identifierForField,
    this.hintText = "Password",
    this.globalFormKey,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
      //         globalFormKey!.currentState!.fields[identifierForField]!.value) {
      //       return "Password entries are not the same";
      //     }
      //     return null;
      //   }
      // ]),
      obscureText: hidePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenSize.width * 0.06),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xffCDC6DE),
        hintText: this.hintText,
        contentPadding: EdgeInsets.only(left: screenSize.width * 0.06),
        errorMaxLines: 3,
        prefixIcon: Icon(
          Icons.lock_outlined,
          color: Colors.grey.shade700,
        ),
        suffixIcon: IconButton(
          onPressed: onPress,
          color: Colors.grey.shade700,
          icon: Icon(
            hidePassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
