import 'dart:async';
import 'dart:convert';

import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';
import 'package:event_corner/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loading_animations/loading_animations.dart';

class SplashScreen extends StatefulWidget {
  final AppModel appModel;
  final FlutterSecureStorage secureStorage;
  const SplashScreen({Key key, this.appModel, this.secureStorage})
      : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Timer timer;
  Widget widgetComponent;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            if (mounted) {
              setState(() {});
            }
          });
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    if (mounted) {
//      Future.delayed(Duration(milliseconds: 5000), () {
//        animationController.reverse(from: 0.0)
//          ..then((value) => Navigator.push(
//              context,
//              CupertinoPageRoute(
//                  fullscreenDialog: true,
//                  builder: (_) => LoginPage(
//                      appModel: widget.appModel,
//                      flutterSecureStorage: widget.secureStorage))));
//      });
    }
    widget.secureStorage.read(key: 'EVENTCORNER::LOGIN').then((val) {
      Map map = val != null ? jsonDecode(val) : null;
      timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
        if (mounted) {
          setState(() {
            widgetComponent = LoginPage(
              appModel: widget.appModel,
              flutterSecureStorage: widget.secureStorage,
              // fn: changeWidgetComponent,
              uName: map != null ? map['username'] : null,
              passwd: map != null ? map['password'] : null,
            );
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widgetComponent == null
        ? CupertinoPageScaffold(
            child: Container(
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
                    "assets/images/3.png",
                    width: size.width * 0.3,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LoadingBouncingLine.circle(
                    size: 50.0,
                    backgroundColor: kColor,
                    duration: Duration(seconds: 3),
                  ),
                ),
              ],
            ),
          ))
        : widgetComponent;
  }
}
