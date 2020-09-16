import 'dart:convert';
import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';
import 'package:event_corner/model/orderModel.dart';
import 'package:event_corner/provider/provider.dart';
import 'package:event_corner/widget/ticketWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:http/http.dart' as http;

class TicketPage extends StatefulWidget {
  final String orderId;
  final AppModel appModel;
  const TicketPage({Key key, this.orderId, this.appModel}) : super(key: key);
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
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
          if(data['data'].length > 0){
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
        ? Container(
      child: Center(child: Text('GR CODE ដែល​អ្នក​បាន​​​ Scan មិនត្រឹមត្រូវ')),
    )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Container(
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//                colors: [Color(0xffff538e), Color(0xffff7378)],
//                begin: Alignment.center,
//                end: Alignment.bottomCenter)),
              color: kShadowColor,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TicketWidget(
                  width: size.width * 0.8,
                  height: size.height * 0.65,
                  isCornerRounded: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "${order['eventDoc']['title']}",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 13, left: 10),
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
                                    Text("${order['_id']}")
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Event Ticket",
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image:
                                          AssetImage("assets/images/2.png"))),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: <Widget>[
                            ticketDetailsWidget(
                                'First Name', '${order['userDoc']['profile']['name'].toUpperCase()}', 'Last Name', ''),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, right: 20),
                              child: ticketDetailsWidget(
                                  'Tel', '+855 ${order['userDoc']['profile']['tel']}', 'Org', '${order['userDoc']['profile']['org'].toUpperCase()}'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 0),
                              child: ticketDetailsWidget(
                                  'Date', '${order['eventDoc']['dateStr']}', 'Session', '${order['time'].toUpperCase()}'),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                                children: List.generate(
                                    24,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Container(
                                            width: 6,
                                            height: 1,
                                            color: Colors.black,
                                          ),
                                        ))),
                          ],
                        ),
                      ),

//                      Container(
//                        width: 250.0,
//                        height: 60.0,
////                        decoration: BoxDecoration(
////                            image: DecorationImage(
////                                image: AssetImage('assets/images/barcode.png'),
////                                fit: BoxFit.cover)),
//                        child: BarcodeGenerator(
//                          fromString: '${widget.orderId}',
//                          codeType: BarCodeType.kBarcodeFormatCode128,
//                        ),
//                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'STATUS : ${order['status'].toUpperCase()}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
            ),
          );
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
                color: Colors.grey,
              ),
            ),
            Text(
              firstDesc,
              style: TextStyle(
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
                  color: Colors.grey,
                ),
              ),
              Text(
                secondDesc,
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

//  Container buildContainer(Size size) {
//    return Container(
//      width: size.width,
//      height: size.height,
//      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
//      child: Column(
//        children: [
//          Container(
//            //logo
//            width: 60,
//            height: 60,
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: AssetImage("assets/images/3.png"))),
//          ),
//          Text(
//            "LA-A EventCorner",
//            style:
//            TextStyle(color: Color(0xff00275e), fontWeight: FontWeight.bold),
//          ),
//          SizedBox(
//            height: 20,
//          ),
//          Row(
//            //Time
//            children: [
//              Text("Time :", style: TextStyle(color: Colors.grey)),
//              Text(
//                " Evening",
//                style: TextStyle(color: Color(0xfff79684)),
//              ),
//            ],
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          Row(
//            //Date
//            children: [
//              Text("Date  :", style: TextStyle(color: Colors.grey)),
//              Text(
//                " 25 September 2020",
//                style: TextStyle(color: Color(0xfff79684)),
//              ),
//            ],
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          Row(
//            //InvoiceN
//            children: [
//              Text("Invoice :", style: TextStyle(color: Colors.grey)),
//              Text(
//                " N001",
//                style: TextStyle(color: Color(0xfff79684)),
//              ),
//            ],
//          ),
////                Divider(
////                  height: 10,
////                  color: Colors.grey,
////                  endIndent: 50,
////                  indent: 1,
////                  thickness: 2.0,
////                ),
//          SizedBox(
//            height: 37,
//          ),
//          Row(
//            children: List.generate(
//                16,
//                    (index) =>
//                    Padding(
//                      padding: const EdgeInsets.only(left: 8.2),
//                      child: Container(
//                        width: 10,
//                        height: 2,
//                        decoration: BoxDecoration(
//                            gradient: LinearGradient(
//                                colors: [Color(0xffff538e), Color(0xffff7378)],
//                                begin: Alignment.center,
//                                end: Alignment.bottomCenter)),
//                      ),
//                    )),
//          ),
//          SizedBox(
//            height: 25,
//          ),
//          Row(
//            //InvoiceN
//            children: [
//              Text("Participant:", style: TextStyle(color: Colors.grey)),
//              Text(
//                " KerKer",
//                style: TextStyle(color: Color(0xff00275e)),
//              ),
//            ],
//          ),
//          SizedBox(
//            height: size.height * 0.02,
//          ),
//          Container(
//            width: size.width,
//            height: size.height * 0.05,
//            child: Table(
//              border: TableBorder.symmetric(
//                  inside: BorderSide(color: Color(0xffff538e))),
//              children: [
//                TableRow(children: [
//                  Center(child: Text("N")),
//                  Center(child: Text("Product")),
//                  Center(child: Text("Qty")),
//                  Center(child: Text("Price")),
//                  Center(child: Text("Amount")),
//                ]),
//                TableRow(children: [
//                  Center(child: Text("1")),
//                  Center(child: Text("VIP")),
//                  Center(child: Text("2")),
//                  Center(child: Text("2 \$")),
//                  Center(child: Text("4\$")),
//                ]),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
}
