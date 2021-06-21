import 'package:flutter/material.dart';
import 'package:simply_meet/start/view_models/start_up_view_model.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final startUpViewModel = StartUpViewModel();
    
    return FutureBuilder<Widget>(
      future: startUpViewModel.redirectView(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!;
        } else {
          return startUpViewModel.startUpView(context);
        }
      },
    );
  }
}
