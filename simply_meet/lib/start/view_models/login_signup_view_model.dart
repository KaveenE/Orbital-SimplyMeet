import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/flutterfire/authentication_service.dart';
import 'package:simply_meet/timetable/home_view.dart';
import 'package:simply_meet/shared/models/custom_exception.dart';
import 'package:simply_meet/shared/utility/dialog_manager.dart';
import 'package:simply_meet/start/ui/helper_widgets/form_utility.dart';
import 'package:simply_meet/start/ui/widgets/LoginArea.dart';
import 'package:simply_meet/start/ui/widgets/SignUpArea.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/shared/view_models/loadable_model.dart';

class LoginSignUpViewModel extends LoadableModel {
  late int _currentPage;
  late final int _numPages;
  late final BuildContext _context;
  late final FormUtility _formInfoCarrier;

  LoginSignUpViewModel({
    required int currentPage,
    required int numPages,
    required BuildContext context,
    required FormUtility formInfoCarrier,
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
      [LoginArea()],
      [SignUpArea()],
    ];
  }

  //Methods via delegation of FormCarrier class
  void setCurrentPage(int currPage) {
    _currentPage = currPage;
    notifyListeners();
  }

  void toggleVisibility() {
    this._formInfoCarrier.toggleVisibility();
    super.notifyListeners();
  }

  bool get hidePassword => this._formInfoCarrier.hidePassword;

  List<GlobalKey<FormBuilderState>> get globalFormKeyList =>
      this._formInfoCarrier.globalFormKeyList;

  //Methods via delegation of AuthenticationService class
  Future<void> logIn({
    required GlobalKey<FormBuilderState> formKey,
    required BuildContext context,
  }) async {
    if (!_validateAllFieldsNonEmpty(
        formKey: formKey, context: context, titleForDialog: "Login Failure")) {
      return;
    }

    final email = formKey.currentState!.fields["email"]!.value as String;
    final password = formKey.currentState!.fields["password"]!.value as String;

    final dialogManager = DialogManager.singleton;
    final titleForDialog = "Login Failure";

    super.setBusy(true);
    final response = await Provider.of<AuthenticationService>(context,listen: false)
        .logIn(email: email, password: password);
    super.setBusy(false);

    if (response != null) {
      dialogManager.defaultErrorDialog(
          title: titleForDialog, description: response, context: context)
        ..show();
    } else {
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  Future<void> signUp({
    required GlobalKey<FormBuilderState> formKey,
    required BuildContext context,
  }) async {
    if (!_validateAllFieldsNonEmpty(
        formKey: formKey,
        context: context,
        titleForDialog: "Sign Up Failure")) {
      return;
    }

    final email = formKey.currentState!.fields["email"]?.value as String;
    final password = formKey.currentState!.fields["password"]?.value as String;
    final reEnteredPassword =
        formKey.currentState!.fields["confirmPassword"]?.value as String;

    final dialogManager = DialogManager.singleton;
    final titleForDialog = "Sign Up Failure";

    //Local validation
    if (reEnteredPassword.isEmpty ||
        reEnteredPassword.compareTo(password) != 0) {
      dialogManager.defaultErrorDialog(
          title: titleForDialog,
          description: "Passwords entered are not same",
          context: context)
        ..show();

      return;
    }

    super.setBusy(true);
    final response = await Provider.of<AuthenticationService>(context,listen: false)
        .signUp(email: email, password: password);
    super.setBusy(false);

    if (response != null) {
      dialogManager.defaultErrorDialog(
          title: titleForDialog, description: response, context: context)
        ..show();
    } else {
      Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  bool _validateAllFieldsNonEmpty(
      {required GlobalKey<FormBuilderState> formKey,
      required String titleForDialog,
      required BuildContext context}) {
    try {
      for (final value in formKey.currentState!.fields.values) {
        if (value.value == null || value.value.isEmpty) {
          throw AllFieldsNotFilledException(
              message: "Input fields must not be empty.");
        }
      }
    } on AllFieldsNotFilledException catch (e) {
      DialogManager.singleton.defaultErrorDialog(
          title: titleForDialog, description: e.message, context: context)
        ..show();
      return false;
    }

    return true;
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
    final defaultWidth = screenWidth(context) * 0.04;

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? myWidth : defaultWidth,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff7B51D3) : Color.fromRGBO(210, 180, 222, 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
