import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/login.dart';
import 'package:schoolcool/signup.dart';

class LogInSignUp extends StatefulWidget {
  @override
  _LogInSignUpState createState() => _LogInSignUpState();
}

class _LogInSignUpState extends State<LogInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Login",style: TextStyle(color: kPrimaryLightColor),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("Register",style: TextStyle(color: kPrimaryLightColor),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
