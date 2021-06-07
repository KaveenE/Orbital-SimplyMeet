import 'package:flutter/material.dart';
import 'package:simply_meet/screens/Welcome/widgets/WelcomeScreenPage.dart';
import 'package:simply_meet/screens/login_signUp/LoginSignupScreen.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: myTheme.scaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: const SkipButton(),
            ),
            Spacer(),
            Center(
              child: Text(
                "Welcome to SimplyMeet",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Spacer(),
            Container(
              height: screenSize.height * 0.6,
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _numPages,
                itemBuilder: (_, index) {
                  final currMap = listOfMapsToPass[index];

                  return WelcomeScreenPage(
                    imageURL: currMap["imageURL"]!,
                    title1: currMap["title1"]!,
                    title2: currMap["title2"]!,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(screenSize),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: screenSize.height * 0.07,
              width: double.infinity,
              child: const GetStartedButton(),
            )
          : Text(''),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton();

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return InkWell(
      splashColor: myTheme.primaryColor,
      onTap: () => Navigator.pushNamed(context, LoginSignupScreen.routeName),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Get started',
            style: TextStyle(
              color: myTheme.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () =>
          Navigator.pushNamed(context, LoginSignupScreen.routeName),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final bool isActive;
  final double? myWidth;

  const PageIndicator({
    this.myWidth,
    required this.isActive,
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
        color: isActive ? Colors.white : Color(0xff7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

List<Map<String, String>> listOfMapsToPass = [
  {
    "imageURL": "assets/animations/BoyWithLaptop.json",
    "title1": "Generate timings",
    "title2": "Find optimal time for project meetings without a hassle",
  },
  {
    "imageURL": "assets/animations/GirlWorking.json",
    "title1": "Schedule events",
    "title2": "Keep track of your timetable as well as events in your calendar",
  },
  {
    "imageURL": "assets/animations/TwoPeopleTalking.json",
    "title1": "Privacy guaranteed",
    "title2":
        "You can choose to keep certain events private so you can keep your private life seperate from school life!",
  },
];
