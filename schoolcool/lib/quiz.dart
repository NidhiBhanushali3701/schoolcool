import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/Quiz_components/body.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quiz",
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryLightColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Body(),
    );
  }
}
