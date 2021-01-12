import 'dart:io';
import 'package:flutter/material.dart';
import 'package:paws/authentication.dart';
import 'package:paws/components/forms/buttons/OAuth.dart';

import 'package:paws/components/forms/buttons/PrimaryButton.dart';
import 'package:paws/components/forms/fields/AuthTextField.dart';

class SignUp extends StatefulWidget {
  static final String routeName = "/signup";

  final loginController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      form: [
        AuthTextField(
          label: "Email:",
          controller: widget.loginController,
          keyboard: TextInputType.emailAddress,
        ),
        AuthTextField(
          label: "Name:",
          controller: widget.nameController,
          keyboard: TextInputType.name,
        ),
        AuthTextField(
          label: "Surname:",
          controller: widget.surnameController,
          keyboard: TextInputType.name,
        ),
        AuthTextField(
          label: "Password:",
          controller: widget.passwordController,
          keyboard: TextInputType.visiblePassword,
        ),
        PrimaryButton(text: "Register account", onPressed: () {}),
        FlatButton(
          child: Text("Login"),
          onPressed: () => Navigator.pushNamed(context, SignIn.routeName),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        )
      ],
    );
  }
}

class SignIn extends StatefulWidget {
  static final String routeName = "/signin";

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      form: [
        AuthTextField(
          label: "Email:",
          controller: widget.loginController,
          keyboard: TextInputType.emailAddress,
        ),
        AuthTextField(
          label: "Password:",
          controller: widget.passwordController,
          keyboard: TextInputType.visiblePassword,
        ),
        PrimaryButton(text: "Login", onPressed: () {}),
      ],
    );
  }
}

class AuthScaffold extends StatelessWidget {
  final List<Widget> form;

  AuthScaffold({@required this.form});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/auth_logo.png",
                  height: screenSize.height * 0.4,
                ),
                GoogleAuth(
                  onPressed: () {
                    Platform.isIOS || Platform.isAndroid
                        ? googleAuth()
                        : showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title:
                                  Text("Not yet available on this platform :("),
                            ),
                          );
                  },
                ),
                ...form,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
