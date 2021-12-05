import 'package:flutter/material.dart';
//@dart=2.9
import 'package:schoolcool/SidebarPage.dart';

class MyHomePage extends StatefulWidget {
 
  var title='HOME PAGE';
  MyHomePage({this.title});
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
      body: SidebarPage() 
      );

  }
}