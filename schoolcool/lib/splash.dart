import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/login-signup.dart';
import 'package:schoolcool/login.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LogInSignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/logo4.png'),
              ),
              Container(
                child: const SpinKitThreeBounce(
                  color: kPrimaryLightColor,
                  size: 30.0,
                ),
              ),
            ],
          ),
      ),
    );
  }
}
