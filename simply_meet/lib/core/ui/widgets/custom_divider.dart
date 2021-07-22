import 'package:flutter/material.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Divider(
        height: 1,
        thickness: 2,
        indent: 15,
        endIndent: 15,
        color: theme(context).accentColor.withOpacity(0.3),
      ),
    );
  }
}
