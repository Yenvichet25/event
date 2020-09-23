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