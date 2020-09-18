import 'package:event_corner/pages/coupondata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/constants.dart';
import '../model/constants.dart';
import '../model/constants.dart';
import '../model/constants.dart';

class CouponPage extends StatefulWidget {
  final dynamic coupons;

  const CouponPage({Key key, this.coupons}) : super(key: key);
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  List<String> objectincoupon = [
    "Ticket",
    "LA-A Coffee coupon 40%",
    "An Cha coupon 30%"
  ];

  int selectedIndex;
  var coupons;

  @override
  void initState() {
    setState(() {
//      coupons = widget.order['items'].map((e) => print(e));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.coupons);
    // print(coupons);
    Size size = MediaQuery.of(context).size;
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Stack(
    //       children: [
    //         Container(
    //           width: size.width,
    //           height: size.height,
    //           decoration: BoxDecoration(color: Color(0xff0f0c29)),
    //           child: CustomScrollView(
    //             slivers: [
    //               SliverAppBar(
    //                 pinned: true,
    //                 centerTitle: true,
    //                 title: Text(
    //                   "My Coupons",
    //                   style: GoogleFonts.nunito(color: Colors.grey),
    //                 ),
    //                 backgroundColor: Color(0xff0f0c29),
    //                 elevation: 0.0,
    //                 leading: IconButton(
    //                   icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                 ),
    //               ),
    //               SliverList(
    //                 delegate: SliverChildBuilderDelegate(
    //                   (_, index) {
    //                     return ListCoupons(
    //                       objectincoupon: objectincoupon[index],
    //                       coupons: widget.coupons,
    //                     );
    //                   },
    //                   childCount: 3,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Positioned(
    //             bottom: 10,
    //             right: 10,
    //             child: InkWell(
    //               onTap: () {},
    //               child: Container(
    //                   width: size.width * 0.3,
    //                   height: size.height * 0.08,
    //                   decoration: BoxDecoration(
    //                       boxShadow: [
    //                         BoxShadow(
    //                             color: Colors.teal.withOpacity(0.3),
    //                             blurRadius: 5)
    //                       ],
    //                       border: Border.all(width: 2, color: Colors.teal),
    //                       borderRadius: BorderRadius.circular(5.0)),
    //                   child: Center(
    //                       child: Text(
    //                     "Accept",
    //                     style: GoogleFonts.nunito(color: Colors.white),
    //                   ))),
    //             ))
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          autofocus: true,
          tooltip: 'Accept',
          child: Icon(Icons.assignment_turned_in),
          onPressed: () {},
        ),
        backgroundColor: kShadowColor,
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kShadowListColor,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Container(
                    color: kShadowColor,
                    width: size.width,
                    height: size.height,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: (){
                            print(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.chrome_reader_mode,
                                              size: 28,
                                              color: kShadowColor,
                                            ),
                                            SizedBox(
                                              width: size.width * 0.05,
                                            ),
                                            Text(
                                              objectincoupon[index],
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Ubuntu',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.orange,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )));
  }
}

