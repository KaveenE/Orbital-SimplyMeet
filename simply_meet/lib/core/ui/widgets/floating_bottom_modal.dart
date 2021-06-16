import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class _FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const _FloatingModal({required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth(context) * 0.05,
          right: screenWidth(context) * 0.05,
          bottom: screenWidth(context) * 0.05,
        ),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(screenWidth(context) * 0.03),
          child: child,
        ),
      ),
    );
  }
}

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
    context: context,
    builder: builder,
    containerWidget: (_, __, child) => _FloatingModal(
      child: child,
      backgroundColor: backgroundColor,
    ),
    expand: false,
    enableDrag: true,
  );

  return result;
}