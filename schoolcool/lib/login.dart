import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Form(
              child: Column(
                children: [
                  Text("Login"),
                  TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter Email',
                        labelText: "Email"),
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        hintText: 'Enter Password',
                        labelText: "Password"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(title: "Dashboard")));
                    },
                    child: Text("Log In"),
                  ),
                  Image.asset('assets/logo4.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
