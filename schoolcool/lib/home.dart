// ignore: invalid_language_version_override
// ignore_for_file: invalid_language_version_override

import 'package:flutter/material.dart';
//@dart=2.9
import 'package:schoolcool/SidebarPage.dart';
//link the dashboard here

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  var title = 'HOME PAGE', email;
  MyHomePage({Key key, this.title, this.email}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SidebarPage(
          email: widget.email,
        ));
  }
}
