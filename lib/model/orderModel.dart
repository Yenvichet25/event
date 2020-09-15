class Order {
  final String orderBy;
  final DateTime orderDate;
  final String id;
  final String color;
  final String shape;
  final String flavor;
  final String desc;
  final DateTime arrivalTime;
  final List<Product> items;
  final String eventId;
  Order(
      {this.shape,
      this.color,
      this.arrivalTime,
      this.flavor,
      this.orderBy,
      this.orderDate,
      this.id,
      this.desc,
      this.items,
      this.eventId});

  factory Order.fromMap(Map map) {
    List<Product> items = map['items']
        .map((map) => Product.fromJson(map['productDoc']))
        .cast<Product>()
        .toList();
    return Order(
        orderBy: map['orderBy'],
        orderDate: DateTime.parse(map['orderDate']).add(Duration(hours: 7)),
        arrivalTime: map['arrivalTime'] != null
            ? DateTime.parse(map['arrivalTime']).add(Duration(hours: 7))
            : null,
        id: map['_id'],
        desc: map['desc'],
        color: map['color'],
        shape: map['shape'],
        flavor: map['flavor'],
        eventId: map['eventId'],
        items: items
            .where((item) =>
                (item.type == 'stock' && item.expiredAt != null) ||
                item.type == 'none-stock')
            .toList());
  }
}

class Product {
  String id;
  int price;
  String name;
  String skewNumber;
  String type;
  bool isAddToSlide;
  dynamic finishedAddToSlideAt;
  List<ImageUrl> imageUrl;
  dynamic expiredAt;
  String createdBy;
  String categoryId;
  String storeId;
  String status;

  Product({
    this.id,
    this.price,
    this.name,
    this.skewNumber,
    this.type,
    this.isAddToSlide,
    this.finishedAddToSlideAt,
    this.imageUrl,
    this.expiredAt,
    this.createdBy,
    this.categoryId,
    this.storeId,
    this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        price: json["price"],
        name: json["name"],
        skewNumber: json["skewNumber"],
        type: json["type"],
        isAddToSlide: json["isAddToSlide"],
        finishedAddToSlideAt: json["finishedAddToSlideAt"],
        imageUrl: List<ImageUrl>.from(
            json["imageUrl"].map((x) => ImageUrl.fromJson(x))),
        expiredAt: json["expiredAt"],
        createdBy: json["createdBy"],
        categoryId: json["categoryId"],
        storeId: json["storeId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "price": price,
        "name": name,
        "skewNumber": skewNumber,
        "type": type,
        "isAddToSlide": isAddToSlide,
        "finishedAddToSlideAt": finishedAddToSlideAt,
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x.toJson())),
        "expiredAt": expiredAt,
        "createdBy": createdBy,
        "categoryId": categoryId,
        "storeId": storeId,
        "status": status,
      };
}

class ImageUrl {
  String url;
  String token;

  ImageUrl({
    this.url,
    this.token,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        url: json["url"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "token": token,
      };
}
