import 'package:flutter/material.dart';
import 'package:simply_meet/core/ui/views/add_tasks_view.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/ui/widgets/custom_divider.dart';
import 'package:simply_meet/core/ui/widgets/floating_bottom_modal.dart';
import 'package:simply_meet/core/view_models/update_task_viewmodel.dart';

import 'package:simply_meet/shared/models/task.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class UpdateTaskView extends StatelessWidget {
  final Task task;

  const UpdateTaskView({required this.task});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth(context) * 0.01),
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
                return AddTaskView(task: task);
              },
            ),
            context: context,
            fontSizeForHeader: 20,
          ),
          CustomDivider(),
          DrawerItem(
            icon: Icon(
              Icons.delete_forever_rounded,
              color: theme(context).primaryColor,
            ),
            heading: "Delete",
            tapHandler: () => UpdateTaskViewModel.showConfirmationDialog(
              context,
              task,
            ),
            context: context,
            fontSizeForHeader: 20,
          ),
        ],
      ),
    );
  }
}
