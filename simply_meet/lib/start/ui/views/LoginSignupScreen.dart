import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:simply_meet/start/ui/widgets/FormBuilderWrapper.dart';
import 'package:simply_meet/start/view_models/login_signup_view_model.dart';

class LoginSignupScreen extends StatelessWidget {
  static const routeName = '/loginSignupScreen';

  
  static const int _numPages = 2;
  final int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final bool _hidePassword = true;
  final List<GlobalKey<FormBuilderState>> _globalFormKeyList =
      List<GlobalKey<FormBuilderState>>.generate(
    _numPages,
    (index) =>
        GlobalKey<FormBuilderState>(debugLabel: 'GlobalFormKey #$index '),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                  child: ChangeNotifierProvider<LoginSignUpViewModel>(
                    create: (_) => LoginSignUpViewModel(
                      currentPage: _currentPage,
                      numPages: _numPages,
                      context: context,
                      formInfoCarrier: FormInfoCarrier(
                        globalFormKeyList: _globalFormKeyList,
                        hidePassword: _hidePassword,
                      ),
                    ),
                    child: Consumer<LoginSignUpViewModel>(
                      builder: (_, loginSignUpViewModel, __) => Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: loginSignUpViewModel.buildPageIndicator(),
                          ),
                          Expanded(
                            child: PageView.builder(
                              physics: ClampingScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (int page) {
                                loginSignUpViewModel.setCurrentPage(page);
                              },
                              itemCount: _numPages,
                              itemBuilder: (_, idx) {
                                return FormBuilderWrapper(
                                  key: _globalFormKeyList[idx],
                                  childrenInColumn: loginSignUpViewModel
                                      .childrenInColumnTochoose[idx],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
