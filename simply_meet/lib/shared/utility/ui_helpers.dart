import 'package:flutter/material.dart';



const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);

//Screen sizes
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double subScreenWidth(BuildContext context, {double offset = 0}) =>
    MediaQuery.of(context).size.width - offset;
double subScreenHeight(BuildContext context, {double offset = 0}) =>
    MediaQuery.of(context).size.height - offset;

//Theme data
ThemeData theme(BuildContext context) => Theme.of(context);
