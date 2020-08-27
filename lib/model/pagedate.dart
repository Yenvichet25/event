import 'package:flutter/cupertino.dart';

class Image{
  final dynamic img;

  Image({this.img});
}
List<Image> images = [
  Image(img: AssetImage("assets/images/Fintech_mobile_scan_qr-512.png")),
  Image(img: AssetImage("assets/images/ticket-icon-png-4.png")),
];

List<String> text=[
  'Event',
  'Coupon'
];