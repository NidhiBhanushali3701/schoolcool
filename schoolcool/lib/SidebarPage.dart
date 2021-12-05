//@dart=2.9
//ignore_for_file:prefer_const_constructors
// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields

import 'dart:math' as math show pi;
import 'package:flutter/services.dart';
import 'package:schoolcool/constants.dart';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items;
  String _headline='';
  AssetImage _avatarImg =
      AssetImage('assets/avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'About Us',
        icon: Icons.info_rounded,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'MCQs',
        icon: Icons.question_answer_rounded,
        onPressed: () => setState(() => _headline = 'Errors'),
      ),
      CollapsibleItem(
        text: 'Puzzles',
        icon: Icons.quiz_rounded,
        onPressed: () => setState(() => _headline = 'Search'),
      ),
      CollapsibleItem(
        text: 'Website',
        icon: Icons.web_rounded,
        onPressed: () => setState(() => _headline = 'Notifications'),
      ),
      CollapsibleItem(
        text: 'Exit',
        icon: Icons.exit_to_app_rounded,
        onPressed: () => setState(() => _headline = 'Face'),
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
        title: '<Username>',
        // onTitleTap: () {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        // },
        body: _body(size, context),
        backgroundColor: Colors.blueGrey,
        selectedTextColor: kPrimaryLightColor,
        unselectedTextColor: Colors.black,
        unselectedIconColor: Colors.black,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          BoxShadow(
            color: kPrimaryLightColor,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.blueGrey,
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