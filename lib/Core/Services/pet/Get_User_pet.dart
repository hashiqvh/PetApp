import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:pet_app/Core/Models/Pet_Model.dart';
import 'package:http/http.dart' as http;
import 'package:pet_app/Core/Services/Auth/Register.dart';

class GetUserPet {
  Future<List<PetModel>> getUserPet() async {
    print("send message called");
    var box = Hive.box('user');
    var token = box.get('tokenid');
    try {
      print(token);

      http.Response response = await http.get(
        BaseUrl + "petdata/user_pet",
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'token $token',
        },
      );

      List<dynamic> data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        List<PetModel> bet =
            data.map<PetModel>((e) => PetModel.fromJson(e)).toList();
        //print(response.body);
        print(bet.toList());

        return bet;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
