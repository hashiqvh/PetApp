class UserModel {
  final int id;
  final String emailId;
  final String name;
  final String phone;
  final String image;

  final String token;

  UserModel({
    this.id,
    this.emailId,
    this.name,
    this.phone,
    this.image,
    this.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["user"]["id"],
      emailId: json["user"]["email"],
      image: json["user"]["dp"],
      name: json["user"]["last_name"],
      phone: json["user"]["mobile_number"],
      token: json["token"]);
}
