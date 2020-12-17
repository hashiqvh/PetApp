import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Core/Services/pet/Create_Pet.dart';
import 'package:pet_app/Screens/Home/HomePage.dart';
import 'package:pet_app/Screens/Widget/Button.dart';
import 'package:video_player/video_player.dart';

class VideoPicker extends StatefulWidget {
  final String name;
  final String age;
  final String location;
  final String description;
  final String amount;
  final File image1;
  final File image2;
  final File image3;
  final File image4;
  final String category;

  const VideoPicker(
      {Key key,
      this.name,
      this.age,
      this.location,
      this.description,
      this.amount,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.category})
      : super(key: key);
  @override
  _VideoPickerState createState() => _VideoPickerState();
}

class _VideoPickerState extends State<VideoPicker> {
  File videoFile;
  VideoPlayerController _videoPlayerController;
  File videoThumbNail;

  CreatePet createPet = CreatePet();
  Future onVideoButtonPressed(ImageSource source,
      {BuildContext context, int quality}) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      File file = File(result.files.single.path);
      print("File path---------------${file.path}");
      print("File size------------------------${file.lengthSync()}");
      int sizeInBytes = file.lengthSync();
      if (sizeInBytes > Constants.MAX_SIZE_IN_BYTES) {
        showToast(Constants.FILE_SIZE_NOT_VALID);
        Navigator.pop(context);
      }

      videoFile = file;

      _videoPlayerController = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          setState(() {});
          //  _videoPlayerController.play();
          _videoPlayerController.setLooping(true);
        });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: const Text('Select Video'),
        backgroundColor: background,
      ),
      body: SafeArea(
        child: videoFile == null
            ? Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      onVideoButtonPressed(ImageSource.gallery);
                    },
                  ),
                ),
              )
            : Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: [
                          Center(child: VideoPlayer(_videoPlayerController)),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_videoPlayerController.value.isPlaying) {
                                    _videoPlayerController.pause();
                                  } else {
                                    // If the video is paused, play it.
                                    _videoPlayerController.play();
                                  }
                                });
                              },
                              child: Icon(
                                _videoPlayerController.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 50,
                                color: Colors.grey[50],
                              ),
                            ),
                          ),
                        ],
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
                              videoFile = null;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          print("object");
          print(widget.name);
          print(widget.category);

          print(widget.amount);

          print(widget.description);
          print(widget.age);
          print(widget.location);

          bool status = await createPet.sendVideo(
              widget.name,
              widget.category,
              widget.amount,
              widget.description,
              widget.age,
              widget.location,
              widget.image1,
              widget.image2,
              widget.image3,
              widget.image4,
              videoFile);
          status
              ? Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
              : null;
        },
        child: Button(
          label: "Next",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
