import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              child: Column(
                children: [
                  Text("Sign Up"),
                  TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter Name',
                        labelText: "Name"),
                  ),
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
                  TextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.datetime,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.description),
                        hintText: 'Enter DOB',
                        labelText: "DOB"),
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.description),
                        hintText: 'Enter Designation',
                        labelText: "Designation"),
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        hintText: 'Enter Password',
                        labelText: "Password"),
                  ),
                  TextFormField(
                    controller: TextEditingController(),
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.password),
                        hintText: 'Re-Enter Password',
                        labelText: "Password"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(title: "School-Cool")));
                    },
                    child: Text("Register"),
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
