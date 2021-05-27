import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/screens/Login_SignUp/NewSignUpScreen.dart';
import 'package:simply_meet/screens/Login_SignUp/Widgets/EmailTextField.dart';
import 'package:simply_meet/screens/Login_SignUp/Widgets/LoginButton.dart';

class NewLoginScreen extends StatefulWidget {
  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  //static const routeName = "/loginScreen";
  //final Function toggleLoginSignUp;
  //const NewLoginScreen({@required this.toggleLoginSignUp});
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: myTheme.primaryColor,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 9,
                  child: Container(
                      child: Opacity(
                          opacity: 0.7,
                          child: Lottie.asset(
                              "assets/animations/GirlOnPhone.json",
                              width: screenSize.height * 0.43)))),
              Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Padding(
                      padding: EdgeInsets.all(screenSize.height * 0.04),
                      child: Form(
                        key: globalFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'This is a placeholder for a slider',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: myTheme.primaryColor),
                            ),
                            SizedBox(height: screenSize.height * 0.03),
                            EmailTextField(),
                            SizedBox(height: screenSize.height * 0.027),
                            passwordTextField(),
                            SizedBox(height: screenSize.height * 0.014),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot your password?",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      decoration: TextDecoration.underline),
                                )
                              ],
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            LoginButton(myTheme: myTheme),
                            SizedBox(height: screenSize.height * 0.014),
                            RichText(
                                text: TextSpan(
                                    text: "Don't have an account? ",
                                    style:
                                        TextStyle(color: Colors.grey.shade800),
                                    children: <TextSpan>[
                                  TextSpan(
                                    text: "Sign up",
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return NewSignUpScreen();
                                          })),
                                  )
                                ]))
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // Extracted Method
  TextFormField passwordTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      //onSaved: ,
      validator: (input) =>
          input.length < 7 ? "Password should be more than 7 characters" : null,
      obscureText: hidePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xffCDC6DE),
          hintText: "Password",
          contentPadding: EdgeInsets.only(left: 25),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.grey.shade700,
              icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility))),
    );
  }
}
