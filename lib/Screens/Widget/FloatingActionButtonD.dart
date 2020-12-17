import 'package:flutter/material.dart';
import 'package:pet_app/Constant/Constand.dart';

class FloatingActionButtonD extends StatelessWidget {
  const FloatingActionButtonD({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            //                    <--- top side
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        color: background,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.18,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.13,
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: Center(
                  child: Text(
                "Chat Now",
                style: button1,
              )),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.13,
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: Center(
                  child: Text(
                "Call Now",
                style: button1,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class Sold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.13,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
      ),
      child: Center(
          child: Text(
        "Saled",
        style: button1,
      )),
    );
  }
}
