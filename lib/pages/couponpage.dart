import 'package:event_corner/model/constants.dart';
import 'package:event_corner/widget/couponboy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  List<String> objectincoupon = ["Ticket", "Coupon 20%", "BackPack"];
  List<String> backgroundcoupon = ["assets/images/back2.jpg","assets/images/back3.jpg","assets/images/back4.jpg"];
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: Text(
                "My Coupons",
                style: TextStyle(color: Colors.grey),
              ),
              backgroundColor: kSecondnaryColor,
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                        width: size.width,
                        height: size.height * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Couponbody(
                          width: size.width,
                          height: size.height,
                          color: Colors.green,
                          assetimage: "${backgroundcoupon[index]}",
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${objectincoupon[index]}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Column(
                                  children: List.generate(
                                      10,
                                          (index) => Padding(
                                        padding: const EdgeInsets.only(top: 5.0 , left: 5),
                                        child: Container(
                                          width: 2,
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text("x",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                Spacer(
                                  flex: 1,
                                ),
                                Text("1", style: TextStyle(fontSize: 20,color: Colors.white)),
                                Spacer(
                                  flex: 1,
                                ),
                                Text("=",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                Spacer(
                                  flex: 1,
                                ),
                                Text("100", style: TextStyle(fontSize: 20, color: Colors.white)),
                                Spacer(
                                  flex: 1,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  icon: Icon(Icons.check_circle_outline),
                                )
                              ],
                            ),
                          ),
                        )),
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
