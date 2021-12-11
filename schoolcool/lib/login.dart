import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/home.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

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
                  const Text("Login"),
                  TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter Email',
                        labelText: "Email"),
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    obscureText: true,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.password),
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
                    child: const Text("Log In"),
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
