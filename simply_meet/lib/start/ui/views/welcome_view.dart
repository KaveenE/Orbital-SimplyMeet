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
                          height: 55,
                          width: 55,
                        ),
                        const Align(
                          alignment: Alignment.topRight,
                          child: SkipButton(),
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
      onPressed: () => Navigator.pushNamed(context, LoginSignupView.routeName),
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
