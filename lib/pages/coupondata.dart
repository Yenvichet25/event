import 'package:event_corner/widget/couponTicketWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListCoupons extends StatefulWidget {
  final String objectincoupon;
  final dynamic coupons;
  const ListCoupons({Key key, this.objectincoupon, this.coupons}) : super(key: key);
  @override
  _ListCouponsState createState() => _ListCouponsState();
}

class _ListCouponsState extends State<ListCoupons> {
  bool oncheck = false;
  List<IconData> iconfor = [
    FontAwesomeIcons.ticketAlt,
    MdiIcons.bandage,
    FontAwesomeIcons.book
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            oncheck = !oncheck;
          });
        },
        child: Container(
            width: size.width,
            height: size.height * 0.2,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Couponbody(
              width: size.width,
              height: size.height,
              color: Colors.black.withOpacity(0.4),
              colorborder: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconfor[0],
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          widget.coupons,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
//                    Column(
//                      children: List.generate(
//                          8,
//                              (index) => Padding(
//                            padding: const EdgeInsets.only(top: 5.0 , left: 5),
//                            child: Container(
//                              width: 2,
//                              height: 2,
//                              color: Colors.white,
//                            ),
//                          )),
//                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text("x",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Spacer(
                      flex: 1,
                    ),
                    Text("1",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Spacer(
                      flex: 1,
                    ),
                    Text("=",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Spacer(
                      flex: 1,
                    ),
                    Text("100",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      oncheck == true
                          ? FontAwesomeIcons.checkCircle
                          : FontAwesomeIcons.circle,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
