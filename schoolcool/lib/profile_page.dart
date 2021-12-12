import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

class Profile extends StatefulWidget {
  var email, who;
  Profile({this.email, this.who});
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Profile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController name = TextEditingController(),
      des = TextEditingController(),
      mobile = TextEditingController();
  @override
  void initState() {
    super.initState();
    getS();
    getDown();
  }

  void updateS(String updateField, var updatedValue) {
    FirebaseFirestore.instance
        .collection('students')
        .doc(widget.email.toString())
        .update({
      'design': des.text,
      'name': name.text,
      'mobile': mobile.text,
    });
  }

  void getS() async {
    var data = await FirebaseFirestore.instance.collection('students').get();
    for (var d in data.docs) {
      var d_ = d.data();
      if (widget.email == d.data()['email']) {
        name = TextEditingController(text: '${d.data()['name']}');
        des = TextEditingController(text: '${d.data()['design']}');
        mobile = TextEditingController(text: '${d.data()['mobile']}');
      }
    }
  }

  void updateDown(String updateField, var updatedValue) {
    FirebaseFirestore.instance
        .collection('teachers')
        .doc(widget.email.toString())
        .update({
      'design': des.text,
      'name': name.text,
      'mobile': mobile.text,
    });
  }

  void getDown() async {
    var data = await FirebaseFirestore.instance.collection('teachers').get();
    for (var d in data.docs) {
      var d_ = d.data();
      if (widget.email == d.data()['email']) {
        name = TextEditingController(text: '${d.data()['name']}');
        des = TextEditingController(text: '${d.data()['design']}');
        mobile = TextEditingController(text: '${d.data()['mobile']}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            // stream: widget.who
            //     ? FirebaseFirestore.instance.collection('teachers').snapshots()
            //     :
            stream:
                FirebaseFirestore.instance.collection('students').snapshots(),
            builder: (context, snapshot) {
              return Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 250.0,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.0, top: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: kPrimaryColor,
                                        size: 22.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 25.0),
                                        child: Text('PROFILE',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                fontFamily: 'sans-serif-light',
                                                color: Colors.black)),
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                'https://source.unsplash.com/50x50/?portrait',
                                              ),
                                            ),
                                            width: 175.0,
                                            height: 175.0,
                                            // decoration: BoxDecoration(
                                            //   shape: BoxShape.circle,
                                            //   image: DecorationImage(
                                            //     image:
                                            //         ExactAssetImage('assets/images/as.png'),
                                            //     fit: BoxFit.cover,
                                            //   ),
                                            // )
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 90.0, right: 100.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              CircleAvatar(
                                                backgroundColor: kPrimaryColor,
                                                radius: 25.0,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          )),
                                    ]),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Personal Information',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            _status
                                                ? _getEditIcon()
                                                : Container(),
                                          ],
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            controller: name,
                                            decoration: const InputDecoration(
                                              hintText: "Enter Your Name",
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'Mobile',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: mobile,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Enter Mobile Number"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                !_status
                                    ? _getActionButtons()
                                    : Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Container(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Done",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CircularProgressIndicator(),
              //       Visibility(
              //         visible: snapshot.hasData,
              //         child: Text(
              //           snapshot.data.toString(),
              //           style:
              //               const TextStyle(color: Colors.black, fontSize: 24),
              //         ),
              //       ),
              //     ],
              //   );
              // }
              // else if (snapshot.connectionState == ConnectionState.active ||
              //     snapshot.connectionState == ConnectionState.done) {
              //   if (snapshot.hasError) {
              //     return const Text('Error');
              //   } else if (snapshot.hasData) {
              //     return Container(
              //       color: Colors.white,
              //       child: ListView(
              //         children: <Widget>[
              //           Column(
              //             children: <Widget>[
              //               Container(
              //                 height: 250.0,
              //                 color: Colors.white,
              //                 child: Column(
              //                   children: <Widget>[
              //                     Padding(
              //                         padding: EdgeInsets.only(
              //                             left: 20.0, top: 20.0),
              //                         child: Row(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: <Widget>[
              //                             Icon(
              //                               Icons.arrow_back_ios,
              //                               color: kPrimaryColor,
              //                               size: 22.0,
              //                             ),
              //                             Padding(
              //                               padding:
              //                                   EdgeInsets.only(left: 25.0),
              //                               child: Text('PROFILE',
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.bold,
              //                                       fontSize: 20.0,
              //                                       fontFamily:
              //                                           'sans-serif-light',
              //                                       color: Colors.black)),
              //                             )
              //                           ],
              //                         )),
              //                     Padding(
              //                       padding: EdgeInsets.only(top: 20.0),
              //                       child: Stack(
              //                           fit: StackFit.loose,
              //                           children: <Widget>[
              //                             Row(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.center,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.center,
              //                               children: <Widget>[
              //                                 Container(
              //                                   child: CircleAvatar(
              //                                     radius: 20,
              //                                     backgroundImage: NetworkImage(
              //                                       'https://source.unsplash.com/50x50/?portrait',
              //                                     ),
              //                                   ),
              //                                   width: 175.0,
              //                                   height: 175.0,
              //                                   // decoration: BoxDecoration(
              //                                   //   shape: BoxShape.circle,
              //                                   //   image: DecorationImage(
              //                                   //     image:
              //                                   //         ExactAssetImage('assets/images/as.png'),
              //                                   //     fit: BoxFit.cover,
              //                                   //   ),
              //                                   // )
              //                                 ),
              //                               ],
              //                             ),
              //                             Padding(
              //                                 padding: EdgeInsets.only(
              //                                     top: 90.0, right: 100.0),
              //                                 child: Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment.center,
              //                                   children: <Widget>[
              //                                     CircleAvatar(
              //                                       backgroundColor:
              //                                           kPrimaryColor,
              //                                       radius: 25.0,
              //                                       child: Icon(
              //                                         Icons.camera_alt,
              //                                         color: Colors.white,
              //                                       ),
              //                                     )
              //                                   ],
              //                                 )),
              //                           ]),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //               Container(
              //                 color: Color(0xffFFFFFF),
              //                 child: Padding(
              //                   padding: EdgeInsets.only(bottom: 25.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: <Widget>[
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 25.0),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.start,
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 children: <Widget>[
              //                                   Text(
              //                                     'Parsonal Information',
              //                                     style: TextStyle(
              //                                         fontSize: 18.0,
              //                                         fontWeight:
              //                                             FontWeight.bold),
              //                                   ),
              //                                 ],
              //                               ),
              //                               Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.end,
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 children: <Widget>[
              //                                   _status
              //                                       ? _getEditIcon()
              //                                       : Container(),
              //                                 ],
              //                               )
              //                             ],
              //                           )),
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 25.0),
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.start,
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 children: <Widget>[
              //                                   Text(
              //                                     'Name',
              //                                     style: TextStyle(
              //                                         fontSize: 16.0,
              //                                         fontWeight:
              //                                             FontWeight.bold),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ],
              //                           )),
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 2.0),
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               Flexible(
              //                                 child: TextField(
              //                                   controller: name,
              //                                   decoration:
              //                                       const InputDecoration(
              //                                     hintText: "Enter Your Name",
              //                                   ),
              //                                   enabled: !_status,
              //                                   autofocus: !_status,
              //                                 ),
              //                               ),
              //                             ],
              //                           )),
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 25.0),
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.start,
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 children: <Widget>[
              //                                   Text(
              //                                     'Email ID',
              //                                     style: TextStyle(
              //                                         fontSize: 16.0,
              //                                         fontWeight:
              //                                             FontWeight.bold),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ],
              //                           )),
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 2.0),
              //                           child: Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               Flexible(
              //                                 child: TextField(
              //                                   controller: email,
              //                                   decoration:
              //                                       const InputDecoration(
              //                                           hintText:
              //                                               "Enter Email ID"),
              //                                   enabled: !_status,
              //                                 ),
              //                               ),
              //                             ],
              //                           )),
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 25.0),
              //                           child: new Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               new Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.start,
              //                                 mainAxisSize: MainAxisSize.min,
              //                                 children: <Widget>[
              //                                   new Text(
              //                                     'Mobile',
              //                                     style: TextStyle(
              //                                         fontSize: 16.0,
              //                                         fontWeight:
              //                                             FontWeight.bold),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ],
              //                           )),
              //                       Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 25.0, right: 25.0, top: 2.0),
              //                           child: new Row(
              //                             mainAxisSize: MainAxisSize.max,
              //                             children: <Widget>[
              //                               new Flexible(
              //                                 child: new TextField(
              //                                   controller: mobile,
              //                                   decoration: const InputDecoration(
              //                                       hintText:
              //                                           "Enter Mobile Number"),
              //                                   enabled: !_status,
              //                                 ),
              //                               ),
              //                             ],
              //                           )),
              //                       !_status
              //                           ? _getActionButtons()
              //                           : Center(
              //                               child: Padding(
              //                                 padding: EdgeInsets.all(15),
              //                                 child: Container(
              //                                   child: TextButton(
              //                                     onPressed: () {
              //                                       Navigator.pop(context);
              //                                     },
              //                                     child: Text(
              //                                       "Done",
              //                                       style: TextStyle(
              //                                           fontSize: 16.0,
              //                                           fontWeight:
              //                                               FontWeight.bold),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ],
              //       ),
              //     );
              //   } else {
              //     return const Text('Empty data');
              //   }
              // } else {
              //   return Text('State: ${snapshot.connectionState}');
              // }
            }));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Cancel"),
                textColor: Colors.white,
                color: kPrimaryColor,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: kPrimaryColor,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
