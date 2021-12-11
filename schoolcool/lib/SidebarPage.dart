import 'dart:math' as math show pi;
import 'package:flutter/services.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:schoolcool/home.dart';
import 'package:schoolcool/listview.dart';

launchWebsite() async {
  const url = 'https://www.google.com/';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
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
        text: 'About Us',
        icon: Icons.info_rounded,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'MCQs',
        icon: Icons.question_answer_rounded,
        onPressed: () => setState(() =>
            ListViewPage), //_headline = 'DashBoard'- need to link the MCQs menu page here
      ),
      CollapsibleItem(
        text: 'Puzzles',
        icon: Icons.quiz_rounded,
        onPressed: () => setState(() => _headline = 'Search'),
      ),
      CollapsibleItem(
        text: 'Website',
        icon: Icons.web_rounded,
        onPressed: () => setState(() => launchWebsite),
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
