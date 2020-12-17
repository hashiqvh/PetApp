class PetModel {
  final String petName;
  final String petCategory;
  final String amount;
  final String description;
  final String age;
  final String location;
  // final bool transportation;
  final bool saled;
  final DateTime createddate;
  final String photo1;
  final String photo2;
  final String photo3;
  final String photo4;
  final String video;

  PetModel(
      {this.petName,
      this.petCategory,
      this.amount,
      this.description,
      this.age,
      this.location,
      // this.transportation,
      this.saled,
      this.createddate,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.video});
  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
      petName: json["pet_name"],
      petCategory: json["pet_caegory"],
      amount: json["amount"],
      description: json["description"],
      age: json["age"],
      location: json["location"],
      saled: json["saled"],
      createddate: DateTime.parse(json["created_at"]),
      photo1: json["photo1"],
      photo2: json["photo2"],
      photo3: json["photo3"],
      photo4: json["photo4"],
      video: json["video"]);
}
//DateTime.parse(json["post_date"]
