import 'package:flutter/material.dart';
import 'package:simply_meet/start/ui/views/LoginSignupScreen.dart';
import 'package:simply_meet/shared/ui_helpers.dart';

class WelcomeViewModel extends ChangeNotifier {
  late int _currentPage;
  late final int _numPages;
  late final BuildContext _context;
  WelcomeViewModel(
      {required int currentPage,
      required int numPages,
      required BuildContext context}) {
    this._currentPage = currentPage;
    this._numPages = numPages;
    _context = context;
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

  Widget buildBottomSheet() {
    return _currentPage == _numPages - 1
        ? SizedBox(
            height: screenHeight(_context) * 0.07,
            width: double.infinity,
            child: const _GetStartedButton(),
          )
        : Text('');
  }

  void setCurrentPage(int currPage) {
    _currentPage = currPage;
    notifyListeners();
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
        color: isActive ? Colors.white : Color(0xff7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    

    return InkWell(
      splashColor: theme(context).primaryColor,
      onTap: () => Navigator.pushNamed(context, LoginSignupScreen.routeName),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Get started',
            style: TextStyle(
              color: theme(context).primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
