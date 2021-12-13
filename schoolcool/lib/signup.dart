import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController(),
      password = TextEditingController(),
      pass_word = TextEditingController(),
      dob = TextEditingController(),
      name = TextEditingController(),
      des = TextEditingController(),
      mobile = TextEditingController();
  var sh = false;
  void addUp(var col) {
    FirebaseFirestore.instance.collection(col).doc(email.text).set({
      'email': email.text,
      'password': password.text,
      'name': name.text,
      'mobile': mobile.text,
      'score': '0',
      'design': des.text,
      //'DOB':dob.text.
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Container(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text('REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Enter Name',
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Enter Email',
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: mobile,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Enter Mobile',
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Mobile"),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //   child: TextFormField(
                    //     controller: dob,
                    //     keyboardType: TextInputType.datetime,
                    //     obscureText: true,
                    //     decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.white),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: Colors.white)),
                    //         labelText: 'DOB',
                    //         labelStyle: TextStyle(color: Colors.white),
                    //         hintText: 'Enter DOB'),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: des,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Designation',
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Enter destination'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Enter Password'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: pass_word,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: 'Re-Enter Password'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
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
                          setState(() {
                            sh = true;
                          });
                          try {
                            final cUser = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email.text, password: password.text);
                            FirebaseAuth.instance.currentUser
                                .sendEmailVerification();
                            if (des == 'Teacher')
                              addUp('teachers');
                            else
                              addUp('students');
                            setState(() {
                              sh = false;
                            });
                            if (cUser != null) {
                              if (email.text == 'academyss449@gmail.com') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                          email: email.text,
                                          who: 1,
                                        )));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                          email: email.text,
                                          who: 0,
                                        )));
                              }
                            }
                          } catch (e) {
                            print(e);
                          }
                          setState(() {
                            sh = false;
                          });
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(color: kPrimaryColor, fontSize: 25),
                        ),
                      ),
                    ),
                    Image.asset('assets/logo4.png'),
                  ],
                ),
              ),
            ),
            sh
                ? Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Center(
                    child: Container(),
                  )
          ]),
        ),
      ),
    );
  }
}
