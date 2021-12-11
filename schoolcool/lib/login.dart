import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/home.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController(),
      password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Form(
              //key: _formKey, //commented on 6.11pm 17-3-21
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text('LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: email,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      // ignore: missing_return
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Enter valid email id as abc@gmail.com'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      // ignore: missing_return
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Enter secure password'),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () async {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (_) => Login()));

                        try {
                          final cUser = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          if (cUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                          email: email.text,
                                        )));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: kPrimaryColor, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset('assets/logo4.png'),
                ],
              ),
            ),
          ),
          // child: Container(
          //   child: Form(
          //     child: Column(
          //       children: [
          //         const Text("Login"),
          //         TextFormField(
          //           controller: TextEditingController(),
          //           decoration: const InputDecoration(
          //               icon: Icon(Icons.email),
          //               hintText: 'Enter Email',
          //               labelText: "Email"),
          //         ),
          //         TextFormField(
          //           controller: TextEditingController(),
          //           obscureText: true,
          //           decoration: const InputDecoration(
          //               icon: Icon(Icons.password),
          //               hintText: 'Enter Password',
          //               labelText: "Password"),
          //         ),
          //         MaterialButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) =>
          //                         MyHomePage(title: "Dashboard")));
          //           },
          //           child: const Text("Log In"),
          //         ),
          //         Image.asset('assets/logo4.png'),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
