import 'package:flutter/material.dart';

//Hard coded separators in case we can't use SizedBox.
//TODO: Nivi, could you change up the hardcoded values to your preference and henceforth attempt to use these constants. If that's not possible, then just delete these SizedBox widgets
const Widget horizontalSpaceTiny =  SizedBox(width: 5.0);
const Widget horizontalSpaceSmall =  SizedBox(width: 10.0);
const Widget horizontalSpaceMedium =  SizedBox(width: 25.0);

const Widget verticalSpaceTiny =  SizedBox(height: 5.0);
const Widget verticalSpaceSmall =  SizedBox(height: 10.0);
const Widget verticalSpaceMedium =  SizedBox(height: 25.0);
const Widget verticalSpaceLarge =  SizedBox(height: 50.0);
const Widget verticalSpaceMassive =  SizedBox(height: 120.0);

//Screen sizes
 double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
 double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

 double subScreenWidth(BuildContext context, {double offset = 0}) =>
    MediaQuery.of(context).size.width - offset;
 double subScreenHeight(BuildContext context, {double offset = 0}) =>
    MediaQuery.of(context).size.height - offset;

//Theme data
 ThemeData theme(BuildContext context) => Theme.of(context);


