import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_app/Screens/Home/Home.dart';

import 'Screens/Auth/Login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Hive.openBox('user');
    return Container(
      // ignore: deprecated_member_use
      child: WatchBoxBuilder(
        box: Hive.box('user'),
        builder: (context, box) {
          return box.get('tokenid') == null ? Login() : Home();
        },
      ),
    );
  }
}
