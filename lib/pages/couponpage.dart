import 'package:event_corner/pages/coupondata.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  List<String> objectincoupon = ["Ticket", "Coupon 20%", "BackPack"];

  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(color: Color(0xff0f0c29)),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    centerTitle: true,
                    title: Text(
                      "My Coupons",
                      style: GoogleFonts.nunito(color: Colors.grey),
                    ),
                    backgroundColor: Color(0xff0f0c29),
                    elevation: 0.0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        return ListCoupons(
                          objectincoupon: objectincoupon[index],
                        );
                      },
                      childCount: 3,
                    ),
                  ),

//            SliverToBoxAdapter(
//              child: Container(
//                height: size.height,
//                color: kSecondnaryColor,
//                child: InkWell(
//                  onTap: (){
//                    print("Let go List Coupon");
//                  },
//                  child: ListView.builder(
//                    physics: NeverScrollableScrollPhysics(),
//                    itemCount: 4,
//                    scrollDirection: Axis.vertical,
//                    padding: EdgeInsets.all(0),
//                    itemBuilder: (_, index) {
////                      return Padding(
////                        padding: const EdgeInsets.symmetric(
////                            horizontal: 20, vertical: 10),
////                        child: Container(
////                          height: size.height * 0.09,
////                          decoration: BoxDecoration(
////                            color: kPrimaryColor,
////                            borderRadius: BorderRadius.circular(8.0),
////                            boxShadow: [
////                              BoxShadow(
////                                  offset: Offset(0, 15),
////                                  blurRadius: 15,
////                                  spreadRadius: -10,
////                                  color: kShadowListColor),
////                            ],
////                          ),
////                          child: Column(
////                            mainAxisAlignment: MainAxisAlignment.center,
////                            children: [
////                              Padding(
////                                padding:
////                                const EdgeInsets.symmetric(horizontal: 20),
////                                child: Stack(
////                                  children: [
////                                    Row(
////                                      children: [
////                                        Icon(
////                                          Icons.chrome_reader_mode,
////                                          size: 28,
////                                          color: kShadowColor,
////                                        ),
////                                        SizedBox(
////                                          width: size.width * 0.08,
////                                        ),
////                                        Text(
////                                          "Apple",
////                                          style: TextStyle(
////                                              fontSize: 16.0,
////                                              fontFamily: 'Ubuntu',
////                                              letterSpacing: 1,
////                                              fontWeight: FontWeight.w600),
////                                        )
////                                      ],
////                                    ),
////                                    Row(
////                                      mainAxisAlignment: MainAxisAlignment.end,
////                                      children: [
////                                        Icon(
////                                          Icons.check_circle,
////                                          color: Colors.orange,
////                                        )
////                                      ],
////                                    )
////                                  ],
////                                ),
////                              ),
////                            ],
////                          ),
////                        ),
////                      );
//                      return Container();
//                    },
//                  ),
//                ),
//              ),
//            )
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.teal.withOpacity(0.3),
                                blurRadius: 5)
                          ],
                          border: Border.all(width: 2, color: Colors.teal),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                          child: Text(
                        "Accept",
                        style: GoogleFonts.nunito(color: Colors.white),
                      ))),
                ))
          ],
        ),
      ),
    );
  }
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
