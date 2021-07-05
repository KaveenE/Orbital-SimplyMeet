import 'package:flutter/material.dart';
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

  const DrawerItem({
    this.currBoolean,
    required this.icon,
    required this.heading,
    required this.tapHandler,
    required this.context,
    this.fontSizeForHeader,
    this.activeColor,
    this.inactiveThumbColor,
  });

  @override
  Widget build(BuildContext context) {
    final headingWidget = Text(
      heading,
      style: theme(context)
          .textTheme
          .subtitle1!
          .copyWith(fontSize: fontSizeForHeader ?? 20),
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
