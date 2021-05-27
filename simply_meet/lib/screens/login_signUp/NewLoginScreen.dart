import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simply_meet/constants.dart';
import 'package:simply_meet/screens/login_signUp/NewSignUpScreen.dart';
// import 'package:simply_meet/constants.dart';
// import '../../widgets/Body.dart';
// import './widgets/LoginBodyContent.dart';

class NewLoginScreen extends StatefulWidget {
  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  //static const routeName = "/loginScreen";
  //final Function toggleLoginSignUp;
  //const NewLoginScreen({@required this.toggleLoginSignUp});
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Opacity(
                          opacity: 0.7,
                          child: Lottie.asset(
                              "assets/animations/GirlOnPhone.json",
                              width: 300)))),
              Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'This is a placeholder for a slider',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xffCDC6DE),
                                hintText: "Email Address",
                                contentPadding: EdgeInsets.only(left: 25),
                                suffixIcon: Icon(
                                  Icons.alternate_email_outlined,
                                  color: Colors.grey.shade700,
                                )),
                          ),
                          SizedBox(height: 20),
                          TextField(
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
                                // prefixIcon: Icon(
                                //   Icons.lock,
                                //   color: Colors.grey.shade700,
                                // ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                    color: Colors.grey.shade700,
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                          ),
                          SizedBox(height: 10),
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
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  primary: primaryColor,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  textStyle: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.w800)),
                              onPressed: () {},
                              child: Text("Login"),
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(color: Colors.grey.shade800),
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
                  ))
            ],
          ),
        ),
      ),
    );

    // Scaffold(
    //   body: Column(
    //     children: <Widget>[
    //       Expanded(
    //           flex: 4,
    //           child: Container(decoration: BoxDecoration(color: primaryColor))),
    //       Expanded(
    //           flex: 6,
    //           child: Container(
    //               decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(40),
    //                       topRight: Radius.circular(40)))))
    //     ],
    //   ),
    // );
  }
}

// use container and column
