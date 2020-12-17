import 'package:flutter/material.dart';
import 'package:pet_app/Constant/Constand.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.142,
      child: Center(
        child: ListView(
          shrinkWrap: true,

          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            CategoryWidget(
              text: "Cats",
              image: "assets/images/cat.png",
            ),
            CategoryWidget(
              text: "Dogs",
              image: "assets/images/dog.png",
            ),
            CategoryWidget(
              text: "Fishes",
              image: "assets/images/fish.png",
            ),
            CategoryWidget(
              text: "Exotic",
              image: "assets/images/ham.png",
            ),
            CategoryWidget(
              text: "Birds",
              image: "assets/images/bird.png",
            ),
            CategoryWidget(
              text: "Dove",
              image: "assets/images/dove.png",
            ),
            CategoryWidget(
              text: "Rabit",
              image: "assets/images/rab.png",
            ),
            CategoryWidget(
              text: "Cow",
              image: "assets/images/cov.png",
            ),
            CategoryWidget(
              text: "Goat",
              image: "assets/images/aad.png",
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    this.image,
    this.text,
    this.imageheight,
    this.imagewidth,
  }) : super(key: key);
  final String image;

  final String text;
  final double imageheight;
  final double imagewidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
                child: Text(
              text,
              style: button2,
            )),
          ],
        ),
      ),
    );
  }
}
