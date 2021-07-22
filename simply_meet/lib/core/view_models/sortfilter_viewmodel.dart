import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class SortFilterViewModel extends ChangeNotifier {
  bool _hideComplete = false;
  bool _sortByDate = false;
  bool _sortByPriority = false;

  bool get hideComplete => _hideComplete;
  Icon iconForCompletion(BuildContext context) => _hideComplete
      ? Icon(
          Icons.visibility_off,
          color: theme(context).primaryColor,
        )
      : Icon(
          Icons.visibility,
          color: theme(context).primaryColor,
        );
  void toggleViewByCompletion(bool invertedBool, BuildContext _) {
    _hideComplete = invertedBool;
    super.notifyListeners();
  }

  bool get sortByDate => _sortByDate;
  Icon iconForDate(BuildContext context) => Icon(
        Icons.date_range_rounded,
        color: theme(context).primaryColor,
      );
  void sortViewByDate(bool invertedBool, BuildContext _) {
    _sortByDate = invertedBool;
    super.notifyListeners();
  }

  bool get sortByPriority => _sortByPriority;
  Icon iconForPriority(BuildContext context) => Icon(
        Icons.priority_high_rounded,
        color: theme(context).primaryColor,
      );
  void sortViewByPriority(bool invertedBool, BuildContext _) {
    _sortByPriority = invertedBool;
    super.notifyListeners();
  }
}
