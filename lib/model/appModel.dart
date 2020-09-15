import 'dart:convert';

import 'package:event_corner/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class AppModel extends Model {
//    API URL

  final String url; //https://salewhat.co
  final String prefix; // /api/v1;
  String _username;
  String _password;
  String _token;
  String _storeId;
  String eventId;
  User _user;
  AppModel({@required this.url, @required this.prefix})
      : assert(url != null, prefix != null);

  get uName => _username;
  get passwd => _password;
  get storeId => _storeId;
  get token => _token;
  get user => _user;

  set user(val) => _user = val;
  set uName(val) => _username = val;
  set passwd(val) => _password = val;
  set token(val) => _token = val;
  set storeId(val) => _storeId = val;
  Future loginFn({String username, String password}) async {
    String apiUrl = '$url/user/login';
    return await http
        .post(apiUrl, body: {"username": username, "password": password}).then(
            (http.Response response) {
          return jsonDecode(response.body);
        }).catchError((err) {
      print(err);
    });
  }
}
