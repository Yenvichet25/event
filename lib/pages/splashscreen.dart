import 'package:event_corner/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addListener(() {
            setState(() {});
          });
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    Future.delayed(Duration(seconds: 3), () {
      animationController.reverse(from: 0.0)
        ..then((value) => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => LoginPage())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.5,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/2.png",
              width: size.width * 0.7,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoadingBouncingLine.circle(
              size: 50.0,
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          ),
        ],
      ),
    ));
  }
}
