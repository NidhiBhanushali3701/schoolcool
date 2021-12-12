import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/home.dart';

import 'constants.dart';

class AddQ extends StatefulWidget {
  @override
  _AddQState createState() => _AddQState();
}

class _AddQState extends State<AddQ> {
  TextEditingController question = TextEditingController(),
      op0 = TextEditingController(),
      op1 = TextEditingController(),
      op2 = TextEditingController(),
      op3 = TextEditingController(),
      ans = TextEditingController();
  var sh = false, answer = [], done = false;
  void addUp() {
    FirebaseFirestore.instance.collection('questions').doc().set({
      'question': question,
      'answer': answer,
      'ans': (int.parse(ans.text) - 1),
      //'DOB':dob.text.
    });
  }

  void addQ() async {
    answer.add(op0);
    answer.add(op1);
    answer.add(op2);
    answer.add(op3);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    answer = [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('ADD MCQs'),
        ),
        backgroundColor: kPrimaryLightColor,
        body: !done
            ? SingleChildScrollView(
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Container(
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text('ADD QUESTIONS',
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 25)),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              controller: question,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  hintText: 'Enter Question',
                                  labelStyle: TextStyle(color: kPrimaryColor),
                                  labelText: "Question"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              controller: op0,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  hintText: 'Enter Option 1',
                                  labelStyle: TextStyle(color: kPrimaryColor),
                                  labelText: "Option 1"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              controller: op1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  hintText: 'Enter Option 2',
                                  labelStyle: TextStyle(color: kPrimaryColor),
                                  labelText: "Option 2"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              controller: op2,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  hintText: 'Enter Option 3',
                                  labelStyle: TextStyle(color: kPrimaryColor),
                                  labelText: "Option 3"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              controller: op3,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  hintText: 'Enter Option 4',
                                  labelStyle: TextStyle(color: kPrimaryColor),
                                  labelText: "Option 4"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            child: TextFormField(
                              controller: ans,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor)),
                                  hintText: 'Enter Correct Option',
                                  labelStyle: TextStyle(color: kPrimaryColor),
                                  labelText: "Correct Option"),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
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
                                  addQ();
                                  addUp();
                                  print("done");
                                  setState(() {
                                    sh = false;
                                    done = true;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                                setState(() {
                                  sh = false;
                                  done = true;
                                });
                              },
                              child: Text(
                                'ADD',
                                style: TextStyle(
                                    color: kPrimaryLightColor, fontSize: 25),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
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
              )
            : Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => AddQ()));
                      },
                      child: Text('ADD MCQ',
                          style: TextStyle(color: kPrimaryColor, fontSize: 25)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => MyHomePage())));
                        Navigator.pop(context);
                      },
                      child: Text('HOME',
                          style: TextStyle(color: kPrimaryColor, fontSize: 25)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
