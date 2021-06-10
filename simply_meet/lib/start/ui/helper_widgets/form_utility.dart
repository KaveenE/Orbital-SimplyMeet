import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormUtility {
  late final List<GlobalKey<FormBuilderState>> _globalFormKeyList;
  bool _hidePassword = true;

  FormUtility({
    required List<GlobalKey<FormBuilderState>> globalFormKeyList,
    required bool hidePassword,
  }) {
    _globalFormKeyList = globalFormKeyList;
  }

  List<GlobalKey<FormBuilderState>> get globalFormKeyList {
    List<GlobalKey<FormBuilderState>> duplicate = [];
    duplicate.addAll(_globalFormKeyList);
    return duplicate;
  }

  bool get hidePassword => _hidePassword;
  
  void toggleVisibility() {
    _hidePassword = !_hidePassword;
  }
}
