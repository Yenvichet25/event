import 'dart:async';
import 'dart:convert';

import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'pages/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppModel appModel = AppModel(url: 'https://eventcorner.co', prefix: 'api/v1');
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Timer timer;
  Widget widgetComponent;
  @override
  void initState() {
//    secureStorage.read(key: 'EVENTCORNER::LOGIN').then((val) {
//      Map map = val != null ? jsonDecode(val) : null;
//      timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
//        if (mounted) {
//          setState(() {
//            widgetComponent = LoginPage(
//              appModel: appModel,
//              flutterSecureStorage: secureStorage,
//              // fn: changeWidgetComponent,
//              uName: map != null ? map['username'] : null,
//              passwd: map != null ? map['password'] : null,
//            );
//          });
//        }
//      });
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        scaffoldBackgroundColor: Colors.white,
//        appBarTheme: AppBarTheme(elevation: 0.0,color: Colors.white),
//      ),
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: CupertinoColors.white,
        ),
        home: SplashScreen(
          secureStorage: secureStorage,
          appModel: appModel,
        ));
  }
}
