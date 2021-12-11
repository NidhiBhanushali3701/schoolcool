import 'package:flutter/material.dart';
// import 'package:schoolcool/SidebarPage.dart';
import 'package:schoolcool/details.dart';

class ListViewPage extends StatefulWidget
{
  const ListViewPage({Key key}) : super(key: key);

  @override
BuildListViewPage createState() => BuildListViewPage();
}

class BuildListViewPage extends State<ListViewPage>
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
          subtitle:const Text('The subtitle'),
          leading: const Icon(Icons.thumb_up_sharp),
          trailing: const Icon(Icons.arrow_forward_rounded),
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