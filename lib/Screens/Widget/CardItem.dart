import 'package:flutter/material.dart';
import 'package:pet_app/Constant/Constand.dart';

class CardItem extends StatelessWidget {
  final String image;
  final String location;
  final String amount;
  final String petName;

  const CardItem(
      {Key key, this.image, this.location, this.amount, this.petName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.18,
              ),
            ),
            Text(
              "₹" + amount,
              style: text1,
            ),
            Text(
              petName,
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
                  location,
                  style: text1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
