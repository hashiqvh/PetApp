import 'package:flutter/material.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Constant/Validator.dart';
import 'package:pet_app/Core/Models/UserModel.dart';
import 'package:pet_app/Core/Services/Auth/Login.dart';
import 'package:pet_app/Screens/Home/Home.dart';
import 'package:pet_app/Screens/Widget/Button.dart';
import 'package:pet_app/Screens/Widget/TextField.dart';

import 'Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scafold = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final Loging login = Loging();

  UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafold,
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Auth(
                  text: "Hello Again !",
                  fontsize: 30,
                ),
                Auth(
                  text: "Welcome",
                  fontsize: 30,
                ),
                Auth(
                  text: "back",
                  fontsize: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Formfield(
                          hintText: "Email",
                          validator: validateEmail,
                          value: false,
                          controller: emailController,
                        ),
                        Formfield(
                          hintText: "Password",
                          validator: validatePassword,
                          value: true,
                          controller: passwordController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text("Forgot password?"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Signup();
                                }));
                              },
                              child: Text("Signup?"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                scafold.currentState.showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }

                              final String email = emailController.text;
                              final String password = passwordController.text;
                              final UserModel _user =
                                  await login.loging(email, password);
                              setState(() {
                                user = _user;
                              });
                              _user == null
                                  ? scafold.currentState.showSnackBar(SnackBar(
                                      content: Text("Something Went Wrong"),
                                    ))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                            },
                            child: Button(
                              label: "Login",
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
