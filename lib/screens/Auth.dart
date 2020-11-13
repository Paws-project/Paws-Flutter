import 'package:flutter/material.dart';

import 'package:paws/components/forms/PrimaryButton.dart';
import 'package:paws/components/forms/AuthTextField.dart';

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
    return _AuthScreen(
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
    return _AuthScreen(
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

class _AuthScreen extends StatefulWidget {
  final List<Widget> form;

  _AuthScreen({@required this.form});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<_AuthScreen> {
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
                ...widget.form,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AuthMode { signin, signup }
