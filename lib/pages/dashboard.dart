import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';

import 'package:event_corner/pages/couponscan.dart';

import 'package:event_corner/pages/scanPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DashBoard extends StatefulWidget {
  final AppModel appModel;
  final FlutterSecureStorage secureStorage;

  const DashBoard({Key key, this.appModel, this.secureStorage})
      : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex;
  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    pages = [
      ScanPage(),
      CouponScan(),
    ];
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      backgroundColor: Color(0xfff2f2f2),
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: size.width * 0.45,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/2.png"),
                                fit: BoxFit.contain)),
                      )),
                  SizedBox(height: size.height * 0.12),
                  Container(
                      width: size.width,
                      height: size.height * 0.3,
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildActionsWidget(0, context, size, 'event', () {
                              setState(() {
                                selectedIndex = 0;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ScanPage()));
                            }, 'assets/images/Fintech_mobile_scan_qr-512.png'),
                            buildActionsWidget(1, context, size, 'cupon', () {
                              setState(() {
                                selectedIndex = 1;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CouponScan()));
                            }, 'assets/images/ticket-icon-png-4.png'),
                          ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildActionsWidget(
      int index, BuildContext context, Size size, title, fn, img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
//          type: MaterialType.transparency,
          child: InkWell(
            // radius: 64,
            splashColor: Colors.grey,
            onTap: fn,
            child: Container(
                width: size.width * 0.48,
                height: size.height * 0.18,
                decoration: BoxDecoration(
//                  color: index == selectedIndex ?Colors.red:kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.28,
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(img),
                          )),
//                                       child: Icon(FontAwesomeIcons.qrcode),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      title,
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
                )),
          ),
        ),
      ),
    );
  }

//  Container buildContainer(Size size) {
//    return Container(
//      height: 400,
//      child: ListView.builder(
//        itemCount: 2,
//        scrollDirection: Axis.vertical,
//        itemBuilder: (_, index) {
//          return Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//            child: Container(
//              height: size.height * 0.09,
//              decoration: BoxDecoration(
//                color: kPrimaryColor,
//                borderRadius: BorderRadius.circular(8.0),
//                boxShadow: [
//                  BoxShadow(
//                      offset: Offset(0, 15),
//                      blurRadius: 15,
//                      spreadRadius: -10,
//                      color: kShadowListColor),
//                ],
//              ),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 20),
//                    child: Stack(
//                      children: [
//                        Row(
//                          children: [
//                            Icon(Icons.chrome_reader_mode,size: 28,color: kShadowColor,),
//                            SizedBox(width: size.width*0.08,),
//                            Text("Event",style: TextStyle(
//                              fontSize: 16.0,
//                              fontFamily: 'Ubuntu',
//                              letterSpacing: 1,
//                              fontWeight: FontWeight.w600
//                            ),)
//                          ],
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: [
//                            Icon(Icons.check_circle,color: Colors.orange,)
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
}
