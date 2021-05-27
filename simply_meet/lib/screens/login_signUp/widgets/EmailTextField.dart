import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      //onSaved: ,
      validator: (input) =>
          !input.contains("@") ? "Email address entered is invalid" : null,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xffCDC6DE),
          hintText: "Email Address",
          contentPadding: EdgeInsets.only(left: 25),
          suffixIcon: Icon(
            Icons.alternate_email_outlined,
            color: Colors.grey.shade700,
          )),
    );
  }
}
