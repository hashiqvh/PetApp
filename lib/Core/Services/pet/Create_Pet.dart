import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pet_app/Core/Services/Auth/Register.dart';

class CreatePet {
  Future<bool> sendVideo(
    String petName,
    String petCategory,
    String amount,
    String description,
    String age,
    String location,
    //  bool transportation,
    File photo1,
    File photo2,
    File photo3,
    File photo4,
    File video,
  ) async {
    print("send message called");
    var box = Hive.box('user');
    var token = box.get('tokenid');
    try {
      Dio dio = new Dio();
      dio.options.headers['Authorization'] = "token $token";
      // dio.options.headers['Content-Type'] = "multipart/form-data";

      FormData postCommentData = FormData.fromMap({
        "pet_name": petName,
        "pet_caegory": petCategory,
        "amount": amount,
        "description": description,
        "age": age,
        "location": location,
        // "transportation": transportation,
        "photo1": await MultipartFile.fromFile(photo1.path,
            filename: photo1.toString()),
        "photo2": await MultipartFile.fromFile(photo2.path,
            filename: photo2.toString()),
        "photo3": await MultipartFile.fromFile(photo3.path,
            filename: photo3.toString()),
        "photo4": await MultipartFile.fromFile(photo4.path,
            filename: photo4.toString()),
        "video": await MultipartFile.fromFile(video.path,
            filename: video.toString()),
      });
      final response =
          await dio.post(BaseUrl + "petdata/create_pet", data: postCommentData);
      print(response.data);
      if (response.statusCode == 201) {
        // PetModel petModel = PetModel.fromJson(json.decode(response.data));
        print(response.statusCode);
        // print(petModel.petName);
        return true;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }

    return false;
  }
}
