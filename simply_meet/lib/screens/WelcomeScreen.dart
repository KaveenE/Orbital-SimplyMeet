import 'package:flutter/material.dart';

import '../widgets/WelcomeBodyContent.dart';
import '../widgets/WelcomeBody.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBody(
        child: WelcomeBodyContent(),
      ),
    );
  }
}
