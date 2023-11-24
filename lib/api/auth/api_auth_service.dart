import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../model/user.dart';
import '../api_constants.dart';

class ApiService {
  // api test
  Future<UserModel?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("test rest api $response.body.toString()");
        UserModel _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
