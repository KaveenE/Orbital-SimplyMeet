import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const routeName = "/homeView";
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("I prefer watermelon to guava"),
      ),
    );
  }
}
