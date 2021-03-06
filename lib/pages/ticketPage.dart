import 'dart:convert';
import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';
import 'package:event_corner/model/orderModel.dart';
import 'package:event_corner/model/participant_model.dart';
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

  Future confirmAudient() async {
    String url =
        '${Provider.url}${Provider.prefix}/orders/${order['_id']}/confirm_presence';
    print(url);
    return await http.post(url, headers: {"token": widget.appModel.token}).then(
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
            floatingActionButton: order['isPresence']?Container():CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              color: Colors.grey.withOpacity(0.3),
              child: Text('Accept',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              onPressed: () {
                confirmAudient().then((data) {
                  if(data['code']== 201){
                    Navigator.pop(context);
                  }
                });
              },
            ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Container(
                  color: kPrimaryColor,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TicketWidget(
                        //color: kSecondnaryColor,
                          width: size.width * 0.8,
                          height: size.height * 0.65,
                          isCornerRounded: true,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 120,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image:
                                            AssetImage("assets/images/white.png"))),
                              ),
                              SizedBox(
                                height: 25,
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
                                            fontSize: 14,
                                            color: kPrimaryColor,
                                              fontFamily: 'Ubuntu',),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${order['_id']}",
                                          style: TextStyle(
                                            color: Colors.yellow,
                                              fontSize: 16,
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
                                            color: kPrimaryColor,
                                              fontFamily: 'Ubuntu',
                                            fontSize: 14
                                             ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${order['userDoc']['profile']['name'].toUpperCase()}',
                                          style: TextStyle(
                                            color: Colors.yellow,
                                              fontSize: 16,
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
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${order['eventDoc']['title']}",
                                  style: TextStyle(
                                    color: kPrimaryColor,
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
                                      height:50,
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
                                                    color: Colors.white,
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
                                    color: Colors.white,
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
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      // child: Container(
                      //   width: 50,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //       color: kShadowListColor,
                      //      ),
                      //   child: IconButton(
                      //     onPressed: () {
                      //       // Navigator.push(context, MaterialPageRoute(builder: (_)=>ScanPage()));
                      //       Navigator.pop(context);
                      //     },
                      //     icon: Icon(
                      //       Icons.arrow_back,
                      //       color: kPrimaryColor,
                      //     ),
                      //   ),
                      // ),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text("Back",style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: 'Ubuntu'
                        ),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 10),
                      // child: Container(
                      //   width: 50,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //       color: kShadowListColor,
                      //       shape: BoxShape.circle),
                      //   child: IconButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (_) =>
                      //                   CouponPage(coupons: order['items'])));
                      //     },
                      //     icon: Icon(
                      //       Icons.calendar_view_day,
                      //       color: kPrimaryColor,
                      //     ),
                      //   ),
                      // ),
                      child: InkWell(
                        onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            CouponPage(coupons: order['items'])));
                        },
                        child: Text("Coupons",style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: 'Ubuntu'
                        ),),
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
      debugShowCheckedModeBanner: false,
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
                // Text('GR CODE ដែល​អ្នក​បាន​​​ Scan មិនត្រឹមត្រូវ'),
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
              color: Colors.white,
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
                color: Colors.white,
              ),
            )
          ],
        ),
      )
    ],
  );
}
