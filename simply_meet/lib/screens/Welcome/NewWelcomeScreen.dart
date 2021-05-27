import 'package:flutter/material.dart';
import 'package:simply_meet/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/screens/login_signUp/LoginSignUpScreen.dart';
import 'package:simply_meet/screens/login_signUp/NewLoginScreen.dart';
// import 'package:simply_meet/widgets/Body.dart';
// import 'widgets/WelcomeBodyContent.dart';

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
    //final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    // final Decoration containerDecoration = BoxDecoration(
    //   gradient: LinearGradient(
    //     colors: [
    //       Colors.purpleAccent.shade100,
    //       Colors.pink,
    //     ],
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //   ),
    // );
    // final screen1Animation = Positioned(
    //   child: Opacity(
    //     opacity: 0.85,
    //     child: Lottie.asset("assets/animations/BoyWithLaptop.json",
    //         width: screenSize.width * 0.8),
    //   ),
    //   bottom: screenSize.height * 0.2,
    //   left: 2,
    // );

    return Scaffold(
      backgroundColor: primaryColor,
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
                                      fontFamily: 'Raleway')),
                            )),
                        Container(
                            height: 600,
                            child: PageView(
                                physics: ClampingScrollPhysics(),
                                controller: _pageController,
                                onPageChanged: (int page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 90),
                                            Center(
                                                child: Opacity(
                                              opacity: 0.7,
                                              child: Lottie.asset(
                                                  "assets/animations/BoyWithLaptop.json",
                                                  width:
                                                      screenSize.width * 0.9),
                                            )),
                                            SizedBox(height: 30),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text(
                                                  "Generate timings",
                                                  style: kTitleSyle(),
                                                )),
                                            SizedBox(height: 15),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text(
                                                  "Find optimal time for project meetings without a hassle",
                                                  style: kSubtitleStyle(),
                                                )),
                                          ])),
                                  Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 90),
                                            Center(
                                                child: Opacity(
                                              opacity: 0.7,
                                              child: Lottie.asset(
                                                  "assets/animations/GirlWorking.json",
                                                  width:
                                                      screenSize.width * 0.9),
                                            )),
                                            SizedBox(height: 30),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text(
                                                  "Schedule events",
                                                  style: kTitleSyle(),
                                                )),
                                            SizedBox(height: 15),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text(
                                                  "Keep track of your timetable as well as events in your calendar",
                                                  style: kSubtitleStyle(),
                                                ))
                                          ])),
                                  Padding(
                                      padding: EdgeInsets.all(40.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 90),
                                            Center(
                                                child: Opacity(
                                              opacity: 0.7,
                                              child: Lottie.asset(
                                                  "assets/animations/TwoPeopleTalking.json",
                                                  width:
                                                      screenSize.width * 0.9),
                                            )),
                                            SizedBox(height: 30),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text(
                                                  "Privacy guaranteed",
                                                  style: kTitleSyle(),
                                                )),
                                            SizedBox(height: 15),
                                            Opacity(
                                                opacity: 0.7,
                                                child: Text(
                                                  "You can choose to keep certain events private so you can keep your private life seperate from school life!",
                                                  style: kSubtitleStyle(),
                                                ))
                                          ]))
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
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          : Text(''),
      // Body(
      //   //containerDecoration: containerDecoration,
      //   positionedWidgets: positionedWidgets,
      //   child: WelcomeBodyContent(),
      //   // place in welcomebodycontent widget
      //   //  Text('Welcome to SimplyMeet',
      //   //     style: TextStyle(
      //   //       color: Colors.white,
      //   //       fontSize: 40,
      //   //     )),
      // ),

      // Center(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 300,
      //         width: 00,
      //         child: Lottie.asset("assets/animations/BoyWithLaptop.json"),
      //       ),
      //       Text(
      //         'Hello',
      //         style: TextStyle(
      //           fontSize: 60,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  TextStyle kSubtitleStyle() {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Raleway',
      fontSize: 15,
    );
  }

  TextStyle kTitleSyle() {
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Raleway-Bold',
      fontSize: 30,
    );
  }
}
