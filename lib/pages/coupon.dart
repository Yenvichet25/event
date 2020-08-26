import 'package:event_corner/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Coupon extends StatefulWidget {
  const Coupon({
    Key key,
  }) : super(key: key);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        height: 180,
        decoration: BoxDecoration(
          color: selectedIndex ==0 ?kPrimaryColor : CupertinoColors.activeOrange,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 15,
                spreadRadius: -10,
                color: kShadowListColor),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_view_day,
              color: kShadowColor,
              size: 100,
            ),
            Text(
              "Coupon",
              style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Ubuntu',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    BoxShadow(
                        blurRadius: 2,
                        offset: Offset(0, 2),
                        color: kShadowListColor)
                  ]),
            )
          ],
        ));
  }
}