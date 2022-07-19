import 'dart:html';

import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final screens = [];

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Text("Name",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 17,color: Colors.grey)),
                Padding(padding: EdgeInsets.all(2)),
                Container(
                      height: 70.0,
       child: Card(
          child: Center(
          child: ListTile(
            title: Text("Xyz"),
            leading: Icon(Icons.person),
          ),
          
        ),elevation: 3,),),
        Padding(padding: EdgeInsets.all(5)),
        Text("Role",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 17,color: Colors.grey)),
                Padding(padding: EdgeInsets.all(2)),
       Container(
                      height: 70.0,
       child: Card(
          child: Center(
          child:  ListTile(
            title: Text("Manager"),
            leading: Icon(Icons.business_center)
          ),
          
        ),elevation: 3,),),
        Padding(padding: EdgeInsets.all(5)),
        Text("Employer",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 17,color: Colors.grey)),
                Padding(padding: EdgeInsets.all(2)),
        Container(
                      height: 70.0,
       child: Card(
          child: Center(
          child: ListTile(
            title: Text("Deep Cloud"),
            leading: Icon(Icons.business),
          ),),
          elevation: 3,
        ),),
        Padding(padding: EdgeInsets.all(5)),
        Text("Mobile No.",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 17,color: Colors.grey)),
                Padding(padding: EdgeInsets.all(2)),
         Container(
                      height: 70.0,
       child: Card(
          child: Center(
          child: ListTile(
            title: Text("+91 9191919191"),
            leading: Icon(Icons.call)
          ),),
          elevation: 3,
        ),),
        Padding(padding: EdgeInsets.all(5)),
        Text("Email",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 17,color: Colors.grey)),
                Padding(padding: EdgeInsets.all(2)),
        Container(
                      height: 70.0,
       child: Card(
          child: Center(
          child: ListTile(
            title: Text("something@gmail.com"),
            leading: Icon(Icons.email),
          ),),
          elevation: 3,
        ),),
      ],
    );
  }
}
