import 'package:flutter/material.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Constant/Validator.dart';
import 'package:pet_app/Core/Models/UserModel.dart';
import 'package:pet_app/Core/Services/Auth/Register.dart';
import 'package:pet_app/Screens/Home/Home.dart';
import 'package:pet_app/Screens/Widget/Button.dart';
import 'package:pet_app/Screens/Widget/TextField.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scafold = GlobalKey<ScaffoldState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final Registration register = Registration();

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
                  text: "Hello !",
                  fontsize: 30,
                ),
                Auth(
                  text: "Signup to",
                  fontsize: 30,
                ),
                Auth(
                  text: "get started",
                  fontsize: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Formfield(
                          hintText: "Name",
                          validator: validateName,
                          value: false,
                          controller: nameController,
                        ),
                        Formfield(
                          hintText: "Email",
                          validator: validateEmail,
                          value: false,
                          controller: emailController,
                        ),
                        Formfield(
                          hintText: "Phone Number",
                          validator: validateMobile,
                          value: false,
                          controller: phoneController,
                        ),
                        Formfield(
                          hintText: "Password",
                          validator: validatePassword,
                          value: true,
                          controller: passwordController,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: RichText(
                            text: TextSpan(
                              text: "Already Have An Account",
                              style: sub1,
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Login',
                                  style: sub1,
                                )
                              ],
                            ),
                          ),
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
                              final String name = nameController.text;
                              final String email = emailController.text;
                              final String phone = phoneController.text;
                              final String password = passwordController.text;
                              final UserModel _user = await register
                                  .registration(name, email, phone, password);
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
                              label: "SignUp",
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

class Auth extends StatelessWidget {
  const Auth({
    Key key,
    this.text,
    this.fontsize,
  }) : super(key: key);
  final String text;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.notoSerif(
        textStyle: TextStyle(
            color: purple,
            letterSpacing: .5,
            fontSize: fontsize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
