import 'package:flutter/material.dart';
import 'package:simply_meet/screens/Welcome/Widgets/WelcomeScreen1.dart';
import 'package:simply_meet/screens/Welcome/Widgets/WelcomeScreen2.dart';
import 'package:simply_meet/screens/Welcome/Widgets/WelcomeScreen3.dart';
import 'package:simply_meet/screens/Login_SignUp/NewLoginScreen.dart';
//import 'package:simply_meet/screens/Login_signUp/LoginSignUpScreen.dart';

class NewWelcomeScreen extends StatefulWidget {
  @override
  _NewWelcomeScreenState createState() => _NewWelcomeScreenState();
}

class _NewWelcomeScreenState extends State<NewWelcomeScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xff7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: myTheme.scaffoldBackgroundColor,
      body: Container(
          child: Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return NewLoginScreen();
                              })),
                              child: Text('Skip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  )),
                            )),
                        SizedBox(height: 70),
                        Center(
                            child: Text("Welcome to SimplyMeet",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontFamily: 'Raleway-Bold',
                                  fontSize: 27,
                                ))),
                        SizedBox(height: 40),
                        Container(
                            height: 450,
                            child: PageView(
                                physics: ClampingScrollPhysics(),
                                controller: _pageController,
                                onPageChanged: (int page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                children: <Widget>[
                                  WelcomeScreen1(
                                      screenSize: screenSize, myTheme: myTheme),
                                  WelcomeScreen2(
                                      screenSize: screenSize, myTheme: myTheme),
                                  WelcomeScreen3(
                                      screenSize: screenSize, myTheme: myTheme)
                                ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ])))),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 45,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                  onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NewLoginScreen();
                      })),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('Get started',
                        style: TextStyle(
                            color: myTheme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ))))
          : Text(''),
    );
  }
}
