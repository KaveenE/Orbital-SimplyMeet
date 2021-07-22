import 'package:flutter/material.dart';
import 'package:simply_meet/core/ui/views/create_edit_event_view.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/ui/widgets/custom_divider.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/core/view_models/update_event_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';

import 'package:simply_meet/shared/utility/ui_helpers.dart';

class UpdateEventView extends StatelessWidget {
  final Event event;

  const UpdateEventView({required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DrawerItem(
            icon: Icon(
              Icons.edit_rounded,
              color: theme(context).primaryColor,
            ),
            heading: "Edit",
            tapHandler: () => showFloatingModalBottomSheet(
              context: context,
              builder: (_) {
                return CreateEditEventView(event: event);
              },
            ),
            context: context,
            fontSizeForHeader: 18,
          ),
          CustomDivider(),
          DrawerItem(
            icon: Icon(
              Icons.delete_forever_rounded,
              color: theme(context).primaryColor,
            ),
            heading: "Delete",
            tapHandler: () => UpdateEventViewModel.showConfirmationDialog(
              context,
              event,
            ),
            context: context,
            fontSizeForHeader: 18,
          ),
        ],
      ),
    );
  }
}
