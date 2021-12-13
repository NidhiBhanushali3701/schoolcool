// ignore: file_names
// ignore_for_file: file_names

import 'dart:math' as math show pi;
import 'package:flutter/services.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/mcq.dart';
import 'package:schoolcool/profile_page.dart';
import 'package:schoolcool/quiz.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:schoolcool/dashboard.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/home.dart';
import 'package:schoolcool/listview.dart';

launchWebsite() async {
  const url = 'https://www.ssaeducare.com/';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

Future<bool> exitDialog(context) {
  return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
            title: Text("Are your sure?"),
            content: Text("Do you want to exit the app?"),
            actions: [
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("EXIT")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("CANCEL")),
            ],
          ));
}

@override
Widget build(BuildContext context) {
  return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Button'),
        ),
      ),
      onWillPop: () {
        exitDialog(context);
        return Future.value(false);
      });
}

class SidebarPage extends StatefulWidget {
  var email;
  SidebarPage({this.email});
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items;
  String _headline = '';
  AssetImage _avatarImg = AssetImage('assets/avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.dashboard_rounded,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard(email: widget.email,)));
        },//need to check
        isSelected: true,
      ),
      // CollapsibleItem(
      //   text: 'About Us',
      //   icon: Icons.info_rounded,
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => About()));
      //   },
      //   isSelected: true,
      // ),
      CollapsibleItem(
        text: 'About Us',
          icon: Icons.info_rounded,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => About()));
        }, //setState(() => ListViewPage), // need to link the MCQs menu page here
      ),
      CollapsibleItem(
        text: 'MCQs',
        icon: Icons.question_answer_rounded,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Quiz()));
        }, //setState(() => ListViewPage), // need to link the MCQs menu page here
      ),
      // CollapsibleItem(
      //   text: 'Puzzles',
      //   icon: Icons.quiz_rounded,
      //   onPressed: () => setState(() => _headline = 'Search'),
      // ),
      // CollapsibleItem(
      //   text: 'Website',
      //   icon: Icons.web_rounded,
      //   onPressed: () => launchWebsite, //need to check
      // ),
      CollapsibleItem(
        text: 'Exit',
        icon: Icons.exit_to_app_rounded,
        onPressed: () => setState(() => exitDialog(context)), //Need to check
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: true,
        items: _items,
        avatarImg: _avatarImg,
        title: 'Profile',
        onTitleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile(
                        email: widget.email,
                      )));
          //   ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: _body(size, context),
        backgroundColor: kPrimaryColor,
        selectedTextColor: Colors.white,
        unselectedTextColor: Colors.black,
        unselectedIconColor: Colors.black,
        selectedIconColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 17,
        ),
        titleStyle: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // ignore: prefer_const_literals_to_create_immutables
        sidebarBoxShadow: [
          BoxShadow(
            color: kPrimaryLightColor,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: kPrimaryColor,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
        // height: double.infinity,
        // width: double.infinity,
        // color: Colors.blueGrey[50],
        // child: Center(
        //   child: Transform.rotate(
        //     angle: math.pi / 2,
        //     child: Transform.translate(
        //       offset: Offset(-size.height * 0.3, -size.width * 0.23),
        //       child: Text(
        //         _headline,
        //         style: Theme.of(context).textTheme.headline1,
        //         overflow: TextOverflow.visible,
        //         softWrap: false,
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
