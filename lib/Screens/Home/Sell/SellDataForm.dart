import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Core/Services/location/get_Location.dart';
import '../../Widget/Button.dart';
import 'ImagePicker.dart';

class SellDataForm extends StatefulWidget {
  const SellDataForm({Key key, this.category}) : super(key: key);
  final String category;

  @override
  _SellDataFormState createState() => _SellDataFormState();
}

class _SellDataFormState extends State<SellDataForm> {
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scafold = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  String name;
  String age;
  String amount;
  String description;
  String location;
  Address address; //from geocoder package

  @override
  void initState() {
    initPlatformState();
    categoryController.text = widget.category;
    super.initState();
  }

  initPlatformState() async {
    Address first = await getUserLocation();
    setState(() {
      address = first;
    });
  }

  buildLocationChip(String locationName) {
    if (locationName != null ?? locationName.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: InputChip(
          onPressed: () {
            setState(() {
              locationController.text = locationName;
            });
          },
          label: Text(locationName),
        ),
      );
    } else
      return Container();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafold,
      appBar: AppBar(),
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Form(
                child: Column(
                  children: [
                    Textfield(
                      height: 10.0,
                      hint: "Pet Name",
                      controller: nameController,
                    ),
                    TextFormField(
                      readOnly: true,
                      autofocus: false,
                      controller: categoryController,
                      enabled: false,
                      decoration: new InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "category",
                          hintStyle: textfield1),
                    ),
                    Textfield(
                      height: 10.0,
                      hint: "Amount",
                      controller: amountController,
                    ),
                    Textfield(
                      height: 10.0,
                      hint: "Age",
                      controller: ageController,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            //                    <--- top side
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Textfield2(
                        height: 10.0,
                        hint: "Pet Description",
                        controller: descriptionController,
                      ),
                    ),
                    Textfield(
                      height: 10.0,
                      hint: "Location",
                      controller: locationController,
                    ),
                    (address == null)
                        ? Container()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                buildLocationChip(address.featureName),
                                buildLocationChip(address.subLocality),
                                buildLocationChip(address.locality),
                                buildLocationChip(address.subAdminArea),
                                buildLocationChip(address.adminArea),
                                buildLocationChip(address.countryName),
                              ],
                            ),
                          ),
                    //  (address == null) ? Container() : Divider(),
                  ],
                ),
              )),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            name = nameController.text;
            age = ageController.text;
            amount = amountController.text;
            description = descriptionController.text;
            location = locationController.text;
          });
          print("object");
          print(name);
          print(age);
          print(description);
          print(location);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleImageUpload(
                      age: age,
                      amount: amount,
                      description: description,
                      location: locationController.text,
                      name: name,
                      category: widget.category)));
        },
        child: Button(
          label: "Next",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  const Textfield({Key key, this.hint, this.height, this.controller})
      : super(key: key);
  final String hint;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: height),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hint,
          hintStyle: textfield1),
    );
  }
}

class Textfield2 extends StatelessWidget {
  const Textfield2({Key key, this.hint, this.height, this.controller})
      : super(key: key);
  final String hint;
  final double height;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: new InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: height),
          hintText: hint,
          hintStyle: textfield1),
    );
  }
}
