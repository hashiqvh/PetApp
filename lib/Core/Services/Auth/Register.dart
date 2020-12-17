import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Core/Models/UserModel.dart';

const BaseUrl = "http://ece99c697ab1.ngrok.io/";

class Registration {
  Future<UserModel> registration(
      String name, String emailId, String number, String password) async {
    try {
      final response = await http.post(BaseUrl + "api/auth/register",
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            "last_name": name,
            "mobile_number": number,
            "email": emailId,
            "password": password,
          }));

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("succes");
        UserModel user = UserModel.fromJson(json.decode(response.body));
        var box = Hive.box('user');
        print(user.token);
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
