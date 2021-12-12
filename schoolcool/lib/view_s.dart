import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';

Widget ViewS({var stud}) {
  return Container(
    child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //for (var appUserS in snapshot.data.docs) {
            for (var appUsers in snapshot.data.docs) {
              print(appUsers);
            }
            //}
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occured',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return ListView.builder(
              itemCount: stud.length,
              itemBuilder: (BuildContext context, int i) {
                return student(
                    email: stud[i].email,
                    name: stud[i].name,
                    score: stud[i].score);
              });
        }),
  );
}

Widget student({var name, var email, var score}) {
  return Card(
      child: Container(
    child: Column(
      children: [
        Container(
          child: Icon(Icons.person),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Text(name.toString(),
              style: TextStyle(color: kPrimaryColor, fontSize: 18)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Text(email.toString(),
              style: TextStyle(color: kPrimaryColor, fontSize: 18)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Text(score.toString(),
              style: TextStyle(color: kPrimaryColor, fontSize: 18)),
        ),
      ],
    ),
  ));
}
