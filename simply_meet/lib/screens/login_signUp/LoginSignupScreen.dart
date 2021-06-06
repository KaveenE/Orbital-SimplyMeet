import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/LoginArea.dart';
import 'package:simply_meet/Screens/Login_SignUp/Widgets/SignUpArea.dart';

class LoginSignupScreen extends StatefulWidget {
  static const routeName = '/loginSignupScreen';

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  int _currentPage = 0;
  bool _hidePassword = true;
  GlobalKey<FormBuilderState> _globalFormKey = GlobalKey<FormBuilderState>();
  @override
  initState() {
    super.initState();
    _hidePassword = true;
    _globalFormKey = GlobalKey<FormBuilderState>();
  }

  void togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  List<Widget> _buildPageIndicator(Size screenSize) {
    final width = screenSize.width * 0.06;

    return List.generate(
      _numPages,
      (idx) => idx == _currentPage
          ? PageIndicator(isActive: true, myWidth: width)
          : const PageIndicator(isActive: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Opacity(
                  opacity: 0.7,
                  child: Lottie.asset("assets/animations/Login.json",
                      width: screenSize.height * 0.35),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenSize.height * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(screenSize),
                      ),
                      Container(
                        height: screenSize.height * 0.5,
                        child: PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            FormBuilder(
                              key: _globalFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  LoginArea(
                                    _globalFormKey,
                                    hidePassword: _hidePassword,
                                    togglePasswordVisibility:
                                        togglePasswordVisibility,
                                  ),
                                ],
                              ),
                            ),
                            FormBuilder(
                              key: _globalFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SignUpArea(
                                    _globalFormKey,
                                    hidePassword: _hidePassword,
                                    togglePasswordVisibility:
                                        togglePasswordVisibility,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final bool isActive;
  final double myWidth;

  const PageIndicator({
    this.myWidth,
    @required this.isActive,
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
          color: isActive ? Colors.grey : Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ));
  }
}
