import 'package:flutter/material.dart';
import 'package:schoolcool/mcq.dart';
// import 'package:schoolcool/profile_page.dart';
// import 'package:schoolcool/Splash.dart';
// import 'package:schoolcool/details.dart';
// import 'package:schoolcool/details.dart';
// import 'package:schoolcool/listview.dart';
// import 'package:schoolcool/screens/welcome/welcome.dart';
// import 'login.dart';
// import 'signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // const MyApp({Key key}) : super(key: key); necessary

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //not necessary
      title: 'SS Academy',
      theme: ThemeData(
        primarySwatch: Colors.red//necessary
      ),
      home: Mcq(),
      //  home: const Profile(),
      // home: const Splash(), 
      //home: Welcome(),
      //home: MyHomePage(), //not necessary
    );
  }
}

    // class MyHomePage extends StatelessWidget{
    //   @override
    //   Widget build(BuildContext context){
    //     return Scaffold(
    //       appBar: AppBar(title: Text(
    //         'Subject',)
    //       ),
    //       body: ListViewPage() ,

    //       );
    // }

    // ListView _buildListView(BuildContext context)
    // {
    //   return ListView.builder(
    //     itemCount: 5, 
    //     itemBuilder:(_, index)
    // {
    //     return ListTile(
    //       title: Text('The List item #$index'),
    //       subtitle:Text('The subtitle'),
    //       leading: Icon(Icons.thumb_up_sharp),
    //       trailing: Icon(Icons.arrow_forward_rounded),
    //       onTap: (){
    //         Navigator.push(
    //         context,
    //         MaterialPageRoute(builder:  (context)=> DetailPage(index)));
    //     },
    //     );
    // }
    // );
        
    // }
 //}


 

