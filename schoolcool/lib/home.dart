// ignore: invalid_language_version_override
// ignore_for_file: invalid_language_version_override

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//@dart=2.9
import 'package:schoolcool/SidebarPage.dart';
import 'package:schoolcool/add_q.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/view_s.dart';
//link the dashboard here

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  var title = 'HOME PAGE', email, who;
  MyHomePage({Key key, this.email, this.who}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Student {
  var name, email, mobile, des, score;
  Student({this.name, this.email, this.des, this.mobile, this.score});
}

class _MyHomePageState extends State<MyHomePage> {
  var students = [];
  void getS() async {
    var data = await FirebaseFirestore.instance.collection('students').get();
    for (var d in data.docs) {
      var d_ = d.data();
      if (widget.email == d.data()['email']) {
        students.add(Student(
            name: '${d.data()['name']}',
            email: '${d.data()['email']}',
            des: '${d.data()['design']}',
            mobile: '${d.data()['mobile']}',
            score: '${d.data()['score']}'));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: widget.who == 1
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AddQ()));
                },
                child: Icon(
                  Icons.add,
                  color: kPrimaryLightColor,
                ),
              )
            : Container(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            SidebarPage(
              email: widget.email,
            ),
            widget.who == 1
                ? Container(
                    child: SingleChildScrollView(child: Container(child: ViewS(stud: students))),
                  )
                : Container()
          ],
        ));
  }
}
