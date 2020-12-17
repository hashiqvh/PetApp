import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Screens/Auth/Login.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String name = Hive.box('user').get('name');
    final String phone = Hive.box('user').get('phone');
    final String email = Hive.box('user').get('email');
    final String dp = Hive.box('user').get('dp');
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 70,
                        child: Image.network(dp == null
                            ? "https://st.depositphotos.com/1779253/5140/v/600/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg:widget.profilePictureUrl"
                            : dp),
                        backgroundColor: purple,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            AccountBox(
              text: "Help & Support",
              subtext: "Help Center and legal terms",
            ),
            AccountBox(
              text: "About us",
              subtext: "About the app",
            ),
            GestureDetector(
              onTap: () {
                var box = Hive.box('user');
                box.delete("tokenid");
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: AccountBox(
                text: "Logout",
                subtext: "Leave from this app",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountBox extends StatelessWidget {
  const AccountBox({
    Key key,
    this.text,
    this.subtext,
  }) : super(key: key);
  final String text;
  final String subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtext,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          )),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                    <--- top side
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
