import 'package:event_corner/model/constants.dart';
import 'package:event_corner/widget/couponTicketWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CouponData extends StatefulWidget {
  final dynamic coupons;
  CouponData({Key key, this.coupons}) : super(key: key);
  @override
  _CouponDataState createState() => _CouponDataState();
}

class _CouponDataState extends State<CouponData> {
  bool oncheck = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          oncheck = !oncheck;
        });
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Couponbody(
            height: size.height * 0.20,
            width: size.width,
            color: Colors.white,
            child: Container(
              height: size.height * 0.20,
              decoration: BoxDecoration(
                // color: Color(0xff003060),
                gradient: LinearGradient(
                    colors: [
                      Color(0xff263c77),
                      kSecondnaryColor,
                      //   Color(0xff003060)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 40),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontFamily: 'Ubuntu',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                oncheck == true
                                    ? Icon(
                                        FontAwesomeIcons.checkCircle,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        FontAwesomeIcons.circle,
                                        color: Colors.white,
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      width: size.width * 0.8,
                      child: Text(
                       '${widget.coupons['productDoc']['name']}',
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                          height: 2
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
