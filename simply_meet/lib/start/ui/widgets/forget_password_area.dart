import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/ui/helper_widgets/formbuilder_email.dart';
import 'package:simply_meet/start/view_models/forget_password_view_model.dart';

class ForgetPasswordArea extends StatelessWidget {
  const ForgetPasswordArea();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
        
          Text(
            "Enter your email address",
            style: theme(context).textTheme.headline2!.copyWith(
                color: theme(context).primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 23),
          ),
          Spacer(flex: 2),
          const FormBuilderEmail(),
          Spacer(flex: 2),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                primary: theme(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 10),
                textStyle: theme(context).textTheme.button,
              ),
              onPressed: () async {
                await Provider.of<ForgetPasswordViewModel>(context,
                        listen: false)
                    .resetPassword();
              },
              child: Text("Change Password"),
            ),
          ),
        ],
      ),
    );
  }
}
