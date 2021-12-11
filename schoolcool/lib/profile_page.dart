import 'package:flutter/material.dart';
import 'package:schoolcool/constants.dart';

class Profile extends StatelessWidget{
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryLightColor,
        leading: IconButton
        (
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Profile", style: TextStyle(fontSize:35, letterSpacing:1.2, color:Colors.black, fontWeight:FontWeight.w600,
                )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border:Border.all(color:kPrimaryColor, width:5),
                  shape:BoxShape.circle,
                  color: kPrimaryColor,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/avatar.png')
                  )
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                icon: const Icon(
                  Icons.edit, 
                  color: kPrimaryColor
                ), 
                onPressed:() {}
                ),
              )
            )
        ],
        )
      );
  }
}

