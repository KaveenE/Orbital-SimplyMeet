import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/utility/themes.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class DrawerItem extends StatelessWidget {
  final Icon icon;
  final String heading;

  final bool? currBoolean;
  final Function tapHandler;
  final BuildContext context;
  final double? fontSizeForHeader;
  final Color? activeColor;
  final Color? inactiveThumbColor;
  final ThemeData? currTheme;

  const DrawerItem({
    this.currBoolean,
    required this.icon,
    required this.heading,
    required this.tapHandler,
    required this.context,
    this.currTheme,
    this.fontSizeForHeader,
    this.activeColor,
    this.inactiveThumbColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = theme(context).textTheme.subtitle1!;
    Text headingWidget;

    currTheme == null
        ? headingWidget = Text(
            heading,
            style: textTheme.copyWith(fontSize: 19),
          )
        : headingWidget = Text(
            heading,
            style: currTheme == MyThemes.darkTheme
                ? textTheme.copyWith(fontSize: 19, color: Colors.white)
                : textTheme.copyWith(fontSize: 19),
          );

    return currBoolean == null
        ? ListTile(
            leading: icon,
            title: headingWidget,
            onTap: tapHandler as void Function()?,
          )
        : SwitchListTile(
            value: currBoolean!,
            // ignore: unnecessary_cast
            onChanged: ((invertedBool) => tapHandler(invertedBool, context))
                as void Function(bool),
            secondary: icon,
            title: headingWidget,
            activeColor: this.activeColor,
            inactiveThumbColor: this.inactiveThumbColor,
            dense: true,
          );
  }
}
