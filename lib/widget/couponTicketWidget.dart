import 'package:flutter/material.dart';

class Couponbody extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  Couponbody(
      {@required this.width,
      @required this.height,
      @required this.child,
      this.color = Colors.white,
      this.isCornerRounded = false});
  @override
  _CouponbodyState createState() => _CouponbodyState();
}

class _CouponbodyState extends State<Couponbody> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        width: widget.width,
        height: widget.height,
        child: widget.child,
        decoration: BoxDecoration(
            //boxShadow: [BoxShadow(color: widget.colorborder, blurRadius: 5)],
           // order: Border.all(width: 2),
            color: Colors.white,
            borderRadius: widget.isCornerRounded
                ? BorderRadius.circular(20.0)
                : BorderRadius.circular(0.0)),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 6.0));
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2), radius: 6.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
