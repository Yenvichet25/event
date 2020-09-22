import 'dart:convert';
import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';
import 'package:event_corner/model/orderModel.dart';
import 'package:event_corner/pages/couponpage.dart';
import 'package:event_corner/pages/participants.dart';
import 'package:event_corner/pages/scanPage.dart';
import 'package:event_corner/provider/provider.dart';
import 'package:event_corner/widget/ticketWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class TicketPage extends StatefulWidget {
  final String orderId;
  final AppModel appModel;
  List p = [];
  TicketPage({Key key, this.orderId, this.appModel}) : super(key: key);
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  ParticipantModel participantModel = ParticipantModel();

  Future fetchEvents() async {
    String url =
        '${Provider.url}${Provider.prefix}/orders/${widget.orderId}/show';
    print(url);
    return await http.get(url, headers: {"token": widget.appModel.token}).then(
        (http.Response response) {
      return jsonDecode(response.body);
    });
  }

  var order;
  @override
  void initState() {
    if (widget.orderId != null) {
      fetchEvents().then((data) {
        if (data['code'] == 201) {
          if (data['data'].length > 0) {
            setState(() {
              order = data['data'][0];
            });
          }
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return order == null
        ? buildNoScanResultWidget()
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  pa.add(order);
                });
                Navigator.pop(context);
                print(pa.length);
                print(pa[0]['_id']);
              },
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  color: kShadowColor,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TicketWidget(
                          width: size.width * 0.8,
                          height: size.height * 0.6,
                          isCornerRounded: true,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image:
                                            AssetImage("assets/images/2.png"))),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 0, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "No:",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${order['_id']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${order['userDoc']['profile']['name'].toUpperCase()}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${order['eventDoc']['title']}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: <Widget>[
                                    // ticketDetailsWidget(
                                    //     'Name',
                                    //     '${order['userDoc']['profile']['name'].toUpperCase()}',
                                    //     '',
                                    //     ''),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 20),
                                      child: ticketDetailsWidget(
                                          'Tel',
                                          '+855 ${order['userDoc']['profile']['tel']}',
                                          'Org',
                                          '${order['userDoc']['profile']['org'].toUpperCase()}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 0),
                                      child: ticketDetailsWidget(
                                          'Date',
                                          '${order['eventDoc']['dateStr']}',
                                          'Session',
                                          '${order['time'].toUpperCase()}'),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                        children: List.generate(
                                            24,
                                            (index) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  child: Container(
                                                    width: 6,
                                                    height: 1,
                                                    color: Colors.black,
                                                  ),
                                                ))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'STATUS : ${order['status'].toUpperCase()}',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>ScanPage()));
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 10),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: kShadowListColor,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        CouponPage(coupons: order['items'])));
                          },
                          icon: Icon(
                            Icons.calendar_view_day,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  MaterialApp buildNoScanResultWidget() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(),
                Text('GR CODE ដែល​អ្នក​បាន​​​ Scan មិនត្រឹមត្រូវ'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            firstTitle,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Colors.grey,
            ),
          ),
          Text(
            firstDesc,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Colors.black,
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              secondTitle,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Colors.grey,
              ),
            ),
            Text(
              secondDesc,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            )
          ],
        ),
      )
    ],
  );
}
