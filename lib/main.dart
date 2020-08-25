import 'package:event_corner/model/constants.dart';
import 'package:flutter/material.dart';
import 'pages/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 0.0,color: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}
