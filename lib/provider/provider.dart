import 'package:flutter/cupertino.dart';
class Provider {
//  static const url = 'http://192.168.0.115:3003';
  static const url = 'https://eventcorner.co';
  // static const url = 'http://127.0.0.1:3003';
  static const prefix = '/api/v1';

  static showCustomDialog(BuildContext ctx, String msg) {
    return showCupertinoDialog(
        context: ctx,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(msg),
            actions: <Widget>[
              CupertinoButton(
                child: Text("Confirm"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }
  static firebaseThumbnail(imageUrl,int type) {
    String thumbUrl = "https://firebasestorage.googleapis.com/v0/b/sale-what.appspot.com/o/thumbs%2F";
    final splitUrl = imageUrl.split('%2F');
    final imgName = splitUrl[splitUrl.length - 1];
    thumbUrl += imgName + "_${type}_thumb.png?alt=media";
    return thumbUrl;
  }
  static firebaseThumbnailWithMedia(imageUrl,int type) {
    String thumbUrl = "https://firebasestorage.googleapis.com/v0/b/sale-what.appspot.com/o/thumbs%2F";
    final splitUrl = imageUrl.split('?');
    final secondElement =  splitUrl[0].split('images%2F');

    final imgName = secondElement[1];
    String ext = '.png';
    thumbUrl += imgName + "_${type}_thumb$ext?alt=media";

    return  thumbUrl;
  }

}
