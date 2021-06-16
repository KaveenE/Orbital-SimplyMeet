import 'package:flutter/material.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class DrawerItem extends StatelessWidget {
  final Icon icon;
  final String heading;

  final bool? currBoolean;
  final Function tapHandler;
  final BuildContext context;
  final double? fontSizeForHeader;

  const DrawerItem({
    this.currBoolean,
    required this.icon,
    required this.heading,
    required this.tapHandler,
    required this.context,
    this.fontSizeForHeader,
  });

  @override
  Widget build(BuildContext context) {
    final headingWidget = Text(
      heading,
      style: theme(context)
          .textTheme
          .subtitle1!
          .copyWith(fontSize: fontSizeForHeader ?? 24),
    );


  
    return currBoolean == null
        ? ListTile(
            leading: icon,
            title: headingWidget,
            onTap: tapHandler as void Function()?,
          )
        : SwitchListTile(
            value: currBoolean!,
            onChanged: tapHandler as void Function(bool),
            secondary: icon,
            title: headingWidget,
          );
  }
}