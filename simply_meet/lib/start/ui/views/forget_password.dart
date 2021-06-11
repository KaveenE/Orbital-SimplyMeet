import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/ui/widgets/forget_password_area.dart';
import 'package:simply_meet/start/ui/widgets/formbuilder_wrapper.dart';
import 'package:simply_meet/start/view_models/forget_password_view_model.dart';

class ForgetPasswordView extends StatefulWidget {
  static const routeName = "/forgetPasswordView";
  const ForgetPasswordView();

  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: screenHeight(context),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Opacity(
                  opacity: 0.7,
                  child: Lottie.asset(
                    "assets/animations/DumbGuyThinking.json",
                    fit:BoxFit.cover,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth(context) * 0.03),
                    padding: EdgeInsets.all(screenHeight(context) * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Provider<ForgetPasswordViewModel>(
                      create: (_) => ForgetPasswordViewModel(_formKey, context),
                      child: FormBuilderWrapper(
                        formKey: _formKey,
                        childrenInColumn: [ForgetPasswordArea()],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
