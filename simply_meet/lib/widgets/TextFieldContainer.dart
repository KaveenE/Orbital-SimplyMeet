import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  const TextFieldContainer({
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenSize.width * 0.03,
        horizontal: screenSize.height * 0.02,
      ),
      width: screenSize.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.width * 0.8),
      ),
      child: child,
    );
  }
}
