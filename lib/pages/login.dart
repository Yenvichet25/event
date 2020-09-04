import 'package:event_corner/model/constants.dart';
import 'package:event_corner/widget/fade_animation.dart';
import 'package:event_corner/pages/dashboard.dart';
import 'package:event_corner/widget/page_reveal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        child: Container(
          width: size.width,
          height: size.height,
          child: WillPopScope(
            onWillPop: () {
              setState(() {
                animationController.reverse(from: 1.0);
              });
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.translationValues(
                      0.0, 0.0 + (10 * animation.value), 0.0)
                    ..scale(1.0 - (0.1 * animation.value)),
                  child: Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/bg.jpg"))),
                  ),
                ),
                PageReveal(
                  revealPercent: animation.value,
                  child: Transform(
                    transform: Matrix4.translationValues(0.0,
                        (size.height - ((size.height) * animation.value)), 0.0),
                    child: Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 3,
                              color: Colors.black),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                            topRight: Radius.circular(6.0)
                        )
                      ),
                      child: buildStack(size, context),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, size.height * animation.value, 0.0),
                  child: Column(
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
                                      image:
                                          AssetImage("assets/images/2.png"))),
                            )),
                      ),
                    ],
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, size.height * animation.value, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0XFFDFA278),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 15),
                                blurRadius: 15,
                                spreadRadius: -10,
                                color: kShadowListColor),
                          ],
                        ),
                        child: RawMaterialButton(
                          splashColor: kSecondnaryColor,
                          onPressed: () {
                            animation.value == 0
                                ? animationController.forward(from: 0.1)
                                : animationController.reverse(from: 1.0);
                          },
                          child: Text(
                            "Start",
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.09,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Stack buildStack(Size size, BuildContext context) {
    return Stack(
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
                    color: Color(0xffdfa278),
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
    );
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
