import 'package:event_corner/pages/coupondata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/constants.dart';
import 'dart:convert';

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
  List coupons = [];

  @override
  void initState() {
  setState(() {
    coupons = widget.coupons;
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(coupons[0]['productDoc']);
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: kSecondnaryColor,
              ),
            ),
            centerTitle: true,
            title: Text(
              'Coupons',
              style: TextStyle(
                  color: kSecondnaryColor,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            autofocus: true,
            tooltip: 'Accept',
            child: Icon(Icons.assignment_turned_in),
            onPressed: () {},
          ),
          backgroundColor: kPrimaryColor,
          body: Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 40, left: 10),
                  //   child:
                  // ),
                  Container(
                    color: kPrimaryColor,
                    width: size.width,
                    height: size.height,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: coupons.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (_, index) {
                        return CouponData(
                          coupons: coupons[index],
                        );
                      },
                    ),
                  )
                ],
              ))),
    );
  }
}
