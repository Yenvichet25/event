import 'package:event_corner/model/constants.dart';
import 'package:event_corner/pages/ticketPage.dart';
import 'package:event_corner/widget/ticketWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Participants extends StatefulWidget {
  @override
  _ParticipantsState createState() => _ParticipantsState();
}

List pa = [];

class _ParticipantsState extends State<Participants> {
  ParticipantModel participantModel = ParticipantModel();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondnaryColor,
          title: Text('Participants'),
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: pa.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      leading: Text('${pa[index]['_id']}'),
                      title: Text('${pa[index]['userDoc']['profile']['name']}'),
                      subtitle: Text(
                          '+855 ${pa[index]['userDoc']['profile']['tel']}'),
                    ),
                  );
                }),
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
                      '${pa.length}',
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
        ),
      ),
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
