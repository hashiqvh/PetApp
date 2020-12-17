import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Screens/Home/Sell/VideoPicker.dart';
import 'package:pet_app/Screens/Widget/Button.dart';

class SingleImageUpload extends StatefulWidget {
  final String name;
  final String age;
  final String location;
  final String description;
  final String amount;
  final String category;

  const SingleImageUpload(
      {Key key,
      this.name,
      this.age,
      this.location,
      this.description,
      this.amount,
      this.category})
      : super(key: key);
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
//  List<Object> images = List<Object>();
  File imageFile1;
  File imageFile2;
  File imageFile3;
  File imageFile4;
  File videoFile;
  String image1;
  String image2;
  String image3;
  String image4;
  ImagePicker picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  pickImageFromGallery1() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 100);

    File image = File(pickedFile.path);

    setState(() {
      imageFile1 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image1 = base64Encode(imageBytes);
    });
  }

  pickImageFromGallery2() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 100);

    File image = File(pickedFile.path);

    setState(() {
      imageFile2 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image2 = base64Encode(imageBytes);
    });
  }

  pickImageFromGallery3() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 100);

    File image = File(pickedFile.path);

    setState(() {
      imageFile3 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image3 = base64Encode(imageBytes);
    });
  }

  pickImageFromGallery4() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 100);

    File image = File(pickedFile.path);

    setState(() {
      imageFile4 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image4 = base64Encode(imageBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: const Text('Select Images'),
        backgroundColor: background,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageFile1 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile1,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile1 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery1();
                          },
                        ),
                      ),
                    ),
              imageFile2 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile2,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile2 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery2();
                          },
                        ),
                      ),
                    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageFile3 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile3,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile3 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery3();
                          },
                        ),
                      ),
                    ),
              imageFile4 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile4 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery4();
                          },
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoPicker(
                        age: widget.age,
                        amount: widget.amount,
                        description: widget.description,
                        location: widget.location,
                        name: widget.name,
                        image1: imageFile1,
                        image2: imageFile2,
                        image3: imageFile3,
                        image4: imageFile4,
                        category: widget.category,
                      )));
        },
        child: Button(
          label: "Next",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
