import 'package:flutter/material.dart';
import 'package:simply_meet/core/ui/views/create_edit_event_view.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/core/view_models/update_event_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';

import 'package:simply_meet/shared/utility/ui_helpers.dart';

class UpdateEventView extends StatelessWidget {
  final Event event;

  const UpdateEventView({required this.event});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth(context) * 0.01),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawerItem(
            icon: Icon(Icons.edit),
            heading: "Edit",
            tapHandler: () => showFloatingModalBottomSheet(
              context: context,
              builder: (_)  {
                return CreateEditEventView(event: event);
              },
            ),
            context: context,
            fontSizeForHeader: 20,
          ),
          Divider(),
          DrawerItem(
            icon: Icon(Icons.delete),
            heading: "Delete",
            tapHandler: () => UpdateEventViewModel.showConfirmationDialog(
              context,
              event,
            ),
            context: context,
            fontSizeForHeader: 20,
          ),
        ],
      ),
    );
  }
}
