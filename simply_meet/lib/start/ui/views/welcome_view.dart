import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/start/ui/widgets/welcome_view_body.dart';
import 'package:simply_meet/start/ui/views/login_signup_view.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';
import 'package:simply_meet/start/view_models/welcome_view_model.dart';

class WelcomeView extends StatelessWidget {
  static const routeName = "/welcomeView";
  static const int _numPages = 3;
  final int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeViewModel(
        currentPage: _currentPage,
        numPages: _numPages,
        context: context,
      ),
      child: Consumer<WelcomeViewModel>(
        builder: (_, welcomeViewModel, __) => Scaffold(
          backgroundColor: theme(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            reverse: true,
            child: Container(
              height: screenHeight(context),
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 13.0, left: 20.0, right: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/WhiteLogoWithoutText.png',
                          height: 60,
                          width: 60,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: _currentPage == _numPages - 1
                              ? Text('')
                              : TextButton(
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21.5,
                                    ),
                                  ),
                                  onPressed: () {
                                    _pageController.animateToPage(2,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.decelerate);
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  Center(
                    child: Text(
                      "Welcome to SimplyMeet",
                      style: theme(context).textTheme.headline2,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: screenHeight(context) * 0.6,
                    child: PageView.builder(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        welcomeViewModel.setCurrentPage(page);
                      },
                      itemCount: _numPages,
                      itemBuilder: (_, index) {
                        final currMap = listOfMapsToPass[index];

                        return WelcomeViewBody(
                          imageURL: currMap["imageURL"]!,
                          title1: currMap["title1"]!,
                          title2: currMap["title2"]!,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: welcomeViewModel.buildPageIndicator(),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
          bottomSheet: welcomeViewModel.buildBottomSheet(),
        ),
      ),
    );
  }
}

List<Map<String, String>> listOfMapsToPass = [
  {
    "imageURL": "assets/animations/GirlWithCalendar.json",
    "title1": "Schedule events",
    "title2":
        "Organize your timetable and events throughout the week to facilitate proper management of your day.",
  },
  {
    "imageURL": "assets/animations/Checklist.json",
    "title1": "Track your progress",
    "title2":
        "Keep track of project progress through the use of a nifty to-do list.",
  },
  {
    "imageURL": "assets/animations/PasswordPrivacy.json",
    "title1": "Privacy guaranteed",
    "title2":
        "SimplyMeet protects your privacy, ensuring that your data in the cloud is safe, secure and 100% private.",
  },
];
