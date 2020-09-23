import 'dart:convert';
import 'package:event_corner/model/appModel.dart';
import 'package:event_corner/model/constants.dart';
import 'package:event_corner/pages/ticketPage.dart';
import 'package:event_corner/provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Participants extends StatefulWidget {
  final AppModel appModel;

  const Participants({Key key, this.appModel}) : super(key: key);
  @override
  _ParticipantsState createState() => _ParticipantsState();
}

List pa = [];

class _ParticipantsState extends State<Participants> {
  ParticipantModel participantModel = ParticipantModel();
  List parti = [];
  List registered = [];
  Future fetchParticipants() async {
    String url =
        '${Provider.url}${Provider.prefix}/orders?status=closed&storeId=${widget.appModel.storeId}';
    print(url);
    return await http.get(url, headers: {"token": widget.appModel.token}).then(
        (http.Response response) {
      return jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchParticipants().then((data) {
      if (data['code'] == 201) {
        setState(() {
          parti = data['data'].where((e) => e['isPresence'] == true).toList();
        });
        print(data['data'][0]['isPresence']);
      }
    });
    fetchParticipants().then((data) {
      setState(() {
        registered = data['data'].toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(parti.length);
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        leading: IconButton(
          color: kSecondnaryColor,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Participants',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: kSecondnaryColor,
          ),
        ),
      ),
      body: PageView(
        children: [
          buildPage1(context),
          buildPage2(context)
        ],
      ),
    ));
  }

  Stack buildPage2(BuildContext context) {
    return Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Registered',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: registered.length,
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => TicketPage(
                                            orderId: registered[index]['_id'],
                                            appModel: widget.appModel,
                                          )));
                            },
                            title: Text(
                                '${registered[index]['userDoc']['profile']['name'].toUpperCase()}'),
                            subtitle: Text(
                                '+855 ${registered[index]['userDoc']['profile']['tel']}'),
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${registered[index]['_id']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  registered[index]['isPresence'] == true
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        )
                                      : Container(
                                    width: 10,
                                  ),
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: kSecondnaryColor,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ចំនួនអ្នកបានចុះឈ្មោះ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${registered.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        );
  }

  Stack buildPage1(BuildContext context) {
    return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Confrimed',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: parti.length,
                      itemBuilder: (_, index) {
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => TicketPage(
                                            orderId: parti[index]['_id'],
                                            appModel: widget.appModel,
                                          )));
                            },
                            title: Text(
                                '${parti[index]['userDoc']['profile']['name'].toUpperCase()}'),
                            subtitle: Text(
                                '+855 ${parti[index]['userDoc']['profile']['tel']}'),
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${parti[index]['_id']}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  parti[index]['isPresence']
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        )
                                      : Container(),
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: kSecondnaryColor,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ចំនួនអ្នកចូលរួម',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${parti.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        );
  }
}

class ParticipantModel {
  String tikectId;
  String name;
  String tel;

  ParticipantModel({this.tikectId, this.name, this.tel});
  factory ParticipantModel.fromJson(json) {
    return ParticipantModel(
        tikectId: json['tiketId'], name: json['name'], tel: json['tel']);
  }
}
