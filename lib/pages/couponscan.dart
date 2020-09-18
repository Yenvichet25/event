import 'package:event_corner/model/constants.dart';
import 'package:event_corner/pages/couponpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class CouponScan extends StatefulWidget {
  @override
  _CouponScanState createState() => _CouponScanState();
}

class _CouponScanState extends State<CouponScan> {
  String _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  _qrCallback(String code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
        body: _camState
            ?Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 400,
                  child: QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      _qrCallback(code);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 0),
              child: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: kColor,
                ),
              ),
            ),
            Positioned(
                left: 120,
                top: 60,
                child: Text(
                  "Scan Coupon",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu'),
                ))
          ],
        )
            : CouponPage()
    );
  }
}
