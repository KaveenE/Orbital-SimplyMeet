import 'package:flutter/material.dart';
import '../../../widgets/TextFieldContainer.dart';

class InputWidgetAreaDelete extends StatelessWidget {
  final Widget child;

  const InputWidgetAreaDelete({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 10),
            blurRadius: 10,
          )
        ],
      ),
      child: this.child,
    );
  }
}

class InputWidgetDelete extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Icon leadingIcon;
  final Icon suffixIcon;

  const InputWidgetDelete({
    this.hintText = "Placeholder",
    this.leadingIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return TextFieldContainer(
      child: TextField(
        onChanged: (val) {},
        cursorColor: myTheme.primaryColor,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          hintText: this.hintText,
          hintStyle: myTheme.textTheme.headline6.copyWith(
            color: Colors.grey[400],
            fontWeight: FontWeight.normal,
          ),
          icon: this.leadingIcon,
          suffixIcon: this.suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
