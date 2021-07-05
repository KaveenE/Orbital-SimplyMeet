import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/widgets/DrawerItem.dart';
import 'package:simply_meet/core/view_models/sortfilter_viewmodel.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class SortFilterView extends StatelessWidget {
  const SortFilterView();

  @override
  Widget build(BuildContext context) {
    final sortFilterViewModel = Provider.of<SortFilterViewModel>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth(context) * 0.01),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DrawerItem(
            icon: sortFilterViewModel.iconForCompletion(context),
            heading: "Hide completed tasks",
            currBoolean: sortFilterViewModel.hideComplete,
            tapHandler: sortFilterViewModel.toggleViewByCompletion,
            context: context,
            fontSizeForHeader: 20,
          ),
          DrawerItem(
            icon: sortFilterViewModel.iconForDate(context),
            heading: "By Date",
            currBoolean: sortFilterViewModel.sortByDate,
            tapHandler: sortFilterViewModel.sortViewByDate,
            context: context,
            fontSizeForHeader: 20,
          ),
          Divider(),
          DrawerItem(
            icon: sortFilterViewModel.iconForPriority(context),
            heading: "By Priority Level",
            currBoolean: sortFilterViewModel.sortByPriority,
            tapHandler: sortFilterViewModel.sortViewByPriority,
            context: context,
            fontSizeForHeader: 20,
          ),
        ],
      ),
    );
  }
}
