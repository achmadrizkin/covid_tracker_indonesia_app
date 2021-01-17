import 'dart:convert';

import 'package:loadjson/model/user.dart';
import 'package:http/http.dart' as http;

class UsersApi {
  // -- Network Json --
  static Future<List<User>> getUser() async {
    // getApi from this.
    // https://api.kawalcorona.com/indonesia/

    final url = "https://api.kawalcorona.com/indonesia/";
    final response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<User>(User.fromJson).toList();
  }
}
