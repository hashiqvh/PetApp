import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Core/Services/location/get_Location.dart';
import 'package:pet_app/Screens/Widget/CardItemView.dart';
import 'package:pet_app/Screens/Widget/Category.dart';
import 'package:pet_app/Screens/Widget/TextField.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController locationController = TextEditingController();

  Address address; //from geocoder package

  @override
  void initState() {
    initPlatformState();
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
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          backgroundColor: Colors.grey[200],
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
          title: GestureDetector(
            onTap: () {
              (address == null)
                  ? Container()
                  : showModalBottomSheet<void>(
                      context: context,
                      //  backgroundColor: ,
                      barrierColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              height: 100,
                              padding: EdgeInsets.all(25.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 5),
                                      blurRadius: 15.0,
                                      color: Colors.grey)
                                ],
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return Row(
                                      children: [
                                        buildLocationChip(address.featureName),
                                        buildLocationChip(address.subLocality),
                                        buildLocationChip(address.locality),
                                        buildLocationChip(address.subAdminArea),
                                        buildLocationChip(address.adminArea),
                                        buildLocationChip(address.countryName),
                                      ],
                                    );
                                  })),
                        );
                      });
            },
            child: TextFormField(
              readOnly: true,
              autofocus: false,
              enabled: false,
              controller: locationController,
              decoration: new InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                  ),
                  // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Select Location",
                  hintStyle: textfield1),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Formfield(
                  hintText: "Find Cats,Dogs,Birds.......",
                  validator: null,
                  value: false,
                  icon: Icons.search,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [Container(child: CategoryTitle()), CardItemView()],
        )),
      ),
    );
  }
}
