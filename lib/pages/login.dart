import 'package:event_corner/model/constants.dart';
import 'package:event_corner/model/fade_animation.dart';
import 'package:event_corner/pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
        child: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              "assets/images/signup_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.45,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeAnimation(
                0.8,
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/2.png"))),
                    )),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FadeAnimation(
                1.5,
                buildContainer(
                    size,
                    'Your User name ',
                    false,
                    Icon(
                      Icons.account_circle,
                      color: kTextColor,
                    )),
              ),
              FadeAnimation(
                1.7,
                buildContainer(
                    size,
                    'Password ',
                    true,
                    Icon(
                      Icons.lock,
                      color: kTextColor,
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              FadeAnimation(
                2.0,
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      color: kButtonColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: kShadowColor,
                            offset: Offset(0, 1)),
                      ],
                      borderRadius: BorderRadius.circular(5.0)),
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => DashBoard()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 1,
                          shadows: [
                            BoxShadow(
                                blurRadius: 1,
                                offset: Offset(0, 1),
                                color: kShadowColor)
                          ],
                          color: kPrimaryColor),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  Container buildContainer(Size size, text, bool obscure, Widget icons) {
    return Container(
      width: size.width,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CupertinoTextField(
        placeholder: text,
        placeholderStyle:
            TextStyle(fontSize: 15.0, color: kTextColor, fontFamily: 'Ubuntu'),
        obscureText: obscure,
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: icons,
        ),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 2, color: kShadowColor, offset: Offset(0, 1)),
        ], color: kSecondnaryColor, borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
