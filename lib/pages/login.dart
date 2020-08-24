import 'package:event_corner/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Center(child: Text("Logo")),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            buildContainer(
                size,
                'User name',
                false,
                Icon(
                  CupertinoIcons.person_solid,
                  color: kTextColor,
                )),
            buildContainer(
                size,
                'Password',
                true,
                Icon(
                  CupertinoIcons.padlock_solid,
                  color: kTextColor,
                )),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              onPressed: () {  },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer(Size size, text, bool obscure, Widget icons) {
    return Container(
      width: size.width,
      height: 80,
      padding: EdgeInsets.all(10.0),
      child: CupertinoTextField(
        placeholder: text,
        placeholderStyle: TextStyle(fontSize: 15.0, color: kTextColor),
        obscureText: obscure,
        prefix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icons,
        ),
        prefixMode: OverlayVisibilityMode.editing,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
