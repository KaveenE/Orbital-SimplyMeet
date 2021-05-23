import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;
  final Decoration containerDecoration;
  final List<Positioned>


  Body({this.child, this.containerDecoration, this.list...});

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purpleAccent.shade100,
            Colors.purple[50],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Image.asset(
              "assets/images/randomSide.png",
              width: screenSize.width * 0.2,
            ),
            top: -screenSize.height * 0.05,
            right: 0,
          ),
          Positioned(
            child: Image.asset(
              "assets/images/bottomLeft.png",
              width: screenSize.width * 0.3,
            ),
            bottom: 0,
            left: -screenSize.width * 0.05,
          ),
          this.child,
        ],
      ),
    );
  }
}
