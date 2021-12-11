// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  final int index;
  const DetailPage(this.index);
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('The Details Page'),
    ),
    body: Center(child: Text('The details page #$index', style: const TextStyle(fontSize: 32.0),
    ),
    )
    );
  }
}