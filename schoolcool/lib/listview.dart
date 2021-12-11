import 'package:flutter/material.dart';
import 'package:schoolcool/SidebarPage.dart';
import 'package:schoolcool/details.dart';
import 'package:schoolcool/home.dart';

class ListViewPage extends StatefulWidget
{
  @override
_buildListViewPage createState() => _buildListViewPage();
}

class _buildListViewPage extends State<ListViewPage>
    {
      

    // Widget ListViewPage(BuildContext context)

    // {
    //   ListView.builder(
        
    // {
    //     ListTile(
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
  @override
  Widget build(BuildContext context) {
    void initState() {
    super.initState();
     ListView _buildListView(BuildContext context)
    {
      return ListView.builder(
        itemCount: 5, 
        itemBuilder:(_, index)
    {
        return ListTile(
          title: Text('The List item #$index'),
          subtitle:Text('The subtitle'),
          leading: Icon(Icons.thumb_up_sharp),
          trailing: Icon(Icons.arrow_forward_rounded),
          onTap: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder:  (context)=> DetailPage(index)));
        },
        );
    }
    );
        
    }
    
    throw UnimplementedError();
  }

    }
    }