import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      //onSaved: ,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xffCDC6DE),
          hintText: "Username",
          contentPadding: EdgeInsets.only(left: 25),
          suffixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.grey.shade700,
          )),
    );
  }
}
