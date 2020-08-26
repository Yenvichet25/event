import 'package:event_corner/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'coupon.dart';
import 'event.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      backgroundColor: kSecondnaryColor,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/2.png"))),
                    )),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Submit Documents",
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "We need to verity your infomation.\nPlease submit the documents bellow to process\n your application.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: [
//                    Event(),
//                    Coupon()
//                  ],
//                )
                Container(
                    height: 180,
                    child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (_, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                    width: 170,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? CupertinoColors.activeOrange
                                          : kPrimaryColor.withOpacity(0.5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    )),
                              ),
                            ));
                      },
                    ))
              ],
            )
          ],
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
