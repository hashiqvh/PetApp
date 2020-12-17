import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Core/Models/UserModel.dart';

import 'Register.dart';

class Loging {
  Future<UserModel> loging(String emailId, String password) async {
    try {
      final response = await http.post(BaseUrl + "api/auth/login",
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            "email": emailId,
            "password": password,
          }));

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("succes");
        UserModel user = UserModel.fromJson(json.decode(response.body));
        var box = Hive.box('user');
        print(user);
        box.put('tokenid', user.token);
        box.put('email', user.emailId);
        box.put('phone', user.phone);
        box.put('name', user.name);
        box.put('id', user.id);
        box.put('image', user.image);
        print(user.token);
        return user;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
