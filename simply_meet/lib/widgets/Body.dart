import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;
  final Decoration containerDecoration;
  final List<Positioned> positionedWidgets;

  Body({this.child, this.containerDecoration, this.positionedWidgets});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: double.infinity,
      decoration: containerDecoration,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...positionedWidgets,
          this.child,
        ],
      ),
    );
  }
}
