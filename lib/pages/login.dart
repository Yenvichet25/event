import 'dart:convert';

import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';
import 'package:event_corner/model/user.dart';
import 'package:event_corner/provider/provider.dart';
import 'package:event_corner/widget/fade_animation.dart';
import 'package:event_corner/pages/dashboard.dart';
import 'package:event_corner/widget/page_reveal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  final AppModel appModel;
  final String uName;
  final String passwd;
  final FlutterSecureStorage flutterSecureStorage;
  final Function fn;

  const LoginPage(
      {Key key,
      this.uName,
      this.passwd,
      this.appModel,
      this.flutterSecureStorage,
      this.fn})
      : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isLogin = false;
  void _handleLogin() {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      String uName = _usernameController.value.text;
      String passwd = _passwordController.value.text;
      _handleLoginResult(uName, passwd);
    }
  }

  void _handleLoginResult(String uName, String passwd) {
    widget.appModel.loginFn(username: uName, password: passwd).then((data) {
      if (data['code'] == 201) {
        Future.delayed(Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              isLogin = false;
            });
          }
        });
        User user = User.fromJson(data['data']);
        FlutterSecureStorage flutterSecureStorage = widget.flutterSecureStorage;
        flutterSecureStorage.write(
            key: 'EVENTCORNER::LOGIN',
            value: jsonEncode({"username": uName, "password": passwd}));
        widget.appModel.user = user;
        widget.appModel.token = data['token'];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => DashBoard(
                    appModel: widget.appModel,
                    secureStorage: widget.flutterSecureStorage)));
      } else {
        Future.delayed(Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              isLogin = false;
            });
          }
        });
        Provider.showCustomDialog(context, data['data']);
      }
    }).catchError((err) => print(err.toString()));
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          });
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    if (widget.uName != null && widget.passwd != null) {
      if (mounted) {
        setState(() {
          isLogin = true;
        });
      }
      _handleLoginResult(widget.uName, widget.passwd);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLogin
        ? Scaffold(body: Center(child: CupertinoActivityIndicator()))
        : CupertinoPageScaffold(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(26.0),
                                topRight: Radius.circular(26.0)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/bg.jpg"))),
                      ),
                    ),
                    PageReveal(
                      revealPercent: animation.value,
                      child: Transform(
//                    transform: Matrix4.translationValues(0.0,
//                        (size.height - ((size.height) * animation.value)), 0.0),
                        transform: Matrix4.translationValues(
                            0.0, size.height * 0.15 * animation.value, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(26.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26.0),
                                  topRight: Radius.circular(26.0)),
                            ),
                            child: buildStack(size, context),
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          0.0, size.height * animation.value, 0.0),
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: size.width * 0.7,
                            height: size.height * 0.12,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/2.png"))),
                          )),
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
                              color: kSecondnaryColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 15),
                                    blurRadius: 15,
                                    spreadRadius: -10,
                                    color: kShadowListColor),
                              ],
                            ),
                            child: RawMaterialButton(
                              splashColor: kButtonColor,
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
        Form(
          key: _formKey,
          autovalidate: true,
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
                              image: AssetImage("assets/images/2.png"))),
                    )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              buildContainer(
                  size,
                  'Your User name ',
                  false,
                  Icon(
                    Icons.account_circle,
                    color: kTextColor,
                  ),
                  _usernameController),
              buildContainer(
                  size,
                  'Password ',
                  true,
                  Icon(
                    Icons.lock,
                    color: kTextColor,
                  ),
                  _passwordController),
              SizedBox(
                height: size.height * 0.01,
              ),
              FadeAnimation(
                2.0,
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kSecondnaryColor,
//                    boxShadow: [
//                      BoxShadow(
//                          blurRadius: 2,
//                          color: kShadowColor,
//                          offset: Offset(0, 1)),
//                    ],
//                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: CupertinoButton(
                    onPressed: _handleLogin,
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
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildContainer(
      Size size, text, bool obscure, Widget icons, controller) {
    return Container(
      width: size.width,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CupertinoTextField(
        controller: controller,
        placeholder: text,
        placeholderStyle:
            TextStyle(fontSize: 15.0, color: kTextColor, fontFamily: 'Ubuntu'),
        obscureText: obscure,
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: icons,
        ),
        padding: EdgeInsets.all(0),
//        decoration: BoxDecoration(boxShadow: [
//          BoxShadow(blurRadius: 2, color: kShadowColor, offset: Offset(0, 1)),
//        ], color: kSecondnaryColor, borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
