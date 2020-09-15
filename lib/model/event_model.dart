class EventModel {
   String title;
   String id;

   EventModel({this.title,this.id});

   factory EventModel.fromJson(json) {
      return EventModel(
        title: json['title'],
        id: json['_id']
      );
   }
}