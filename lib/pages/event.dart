import 'package:event_corner/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  const Event({
    Key key,
  }) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170,
        height: 180,
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
            Icon(
              Icons.chrome_reader_mode,
              color: kShadowColor,
              size: 100,
            ),
            Text(
              "Event",
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
        ));
  }
}
