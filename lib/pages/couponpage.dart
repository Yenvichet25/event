import 'package:event_corner/model/constants.dart';
import 'package:flutter/cupertino.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: Container(
        width: size.width,
        height: size.height,
      ),
    );
  }
}
