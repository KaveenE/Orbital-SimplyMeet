import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simply_meet/start/ui/widgets/LoginArea.dart';
import 'package:simply_meet/start/ui/widgets/SignUpArea.dart';
import 'package:simply_meet/shared/ui_helpers.dart';
import 'package:simply_meet/start/view_models/loadable_model.dart';

class LoginSignUpViewModel extends LoadableModel {
  late int _currentPage;
  late final int _numPages;
  late final BuildContext _context;
  late final FormInfoCarrier _formInfoCarrier;

  LoginSignUpViewModel({
    required int currentPage,
    required int numPages,
    required BuildContext context,
    required FormInfoCarrier formInfoCarrier,
  }) {
    this._currentPage = currentPage;
    this._numPages = numPages;
    _context = context;
    _formInfoCarrier = formInfoCarrier;
  }

  List<Widget> buildPageIndicator() {
    final width = screenWidth(_context) * 0.06;

    return List.generate(
      _numPages,
      (idx) => idx == _currentPage
          ? _PageIndicator(isActive: true, myWidth: width)
          : const _PageIndicator(isActive: false),
    );
  }

  List<List<Widget>> get childrenInColumnTochoose {
    return [
      [
        LoginArea(),
      ],
      [
        SignUpArea(),
      ],
    ];
  }

  //Methods via delegation of FormCarrier class
  void setCurrentPage(int currPage) {
    _currentPage = currPage;
    notifyListeners();
  }

  void toggleVisibility() {
    this._formInfoCarrier._toggleVisibility();
    super.notifyListeners();
  }

  bool get hidePassword => this._formInfoCarrier._hidePassword;

  List<GlobalKey<FormBuilderState>> get globalFormKeyList =>
      this._formInfoCarrier.globalFormKeyList;
}

class FormInfoCarrier {
  late final List<GlobalKey<FormBuilderState>> _globalFormKeyList;
  bool _hidePassword = true;

  FormInfoCarrier({
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

  void _toggleVisibility() {
    _hidePassword = !_hidePassword;
  }
}

class _PageIndicator extends StatelessWidget {
  final bool isActive;
  final double? myWidth;

  const _PageIndicator({
    this.myWidth,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final defaultWidth = screenSize.width * 0.04;

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? myWidth : defaultWidth,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xff7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
