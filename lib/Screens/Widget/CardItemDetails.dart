import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Screens/Widget/FloatingActionButtonD.dart';
import 'package:video_player/video_player.dart';

class CardItemDetails extends StatefulWidget {
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

  const CardItemDetails(
      {Key key,
      this.petName,
      this.petCategory,
      this.amount,
      this.description,
      this.age,
      this.location,
      this.saled,
      this.createddate,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.video})
      : super(key: key);

  @override
  _CardItemDetailsState createState() => _CardItemDetailsState();
}

class _CardItemDetailsState extends State<CardItemDetails> {
  VideoPlayerController _controller;

  // ignore: unused_field
  Future<void> _initializeVideoPlayerFuture;

  File videoThumbNail;

  void initState() {
    //ss  getVideoThumbNail();
    _controller = VideoPlayerController.network(
      widget.video,
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
    //String duration = _controller.value.duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButtonD(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    reverse: true,
                    enableInfiniteScroll: true,
                  ),
                  items: [
                    Image.network(
                      widget.photo1,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      widget.photo2,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      widget.photo3,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      widget.photo4,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Stack(
                          children: [
                            Center(
                                child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controller.play();
                                    }
                                  });
                                },
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  size: 50,
                                  color: Colors.grey[50],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹" + widget.amount,
                        style: text1,
                      ),
                      Text(
                        widget.petName,
                        style: text1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 15,
                          ),
                          Text(
                            widget.location,
                            style: text1,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.295),
                          Text(
                            DateFormat('EEE, d MMM').format(widget.createddate),
                            style: textfield1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: text1,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        widget.petCategory,
                        style: text1,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: text1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        style: text1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
