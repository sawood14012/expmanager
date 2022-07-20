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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text(
                  "Profile",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      fontSize: 30),
                ),
              ),
        ListView(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          shrinkWrap: true,
          children: const <Widget>[
            Text("Name",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black)),
            Padding(padding: EdgeInsets.all(2)),
            Card(
              elevation: 3,
              child: Center(
                child: ListTile(
                  title: Text("Xyz"),
                  leading: Icon(Icons.person),
                ),
              ),
            ),
            Text("Role",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black)),
            Padding(padding: EdgeInsets.all(2)),
            Card(
              elevation: 3,
              child: Center(
                child: ListTile(
                    title: Text("Manager"),
                    leading: Icon(Icons.business_center)),
              ),
            ),
            Text("Employer",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black)),
            Padding(padding: EdgeInsets.all(2)),
            Card(
              elevation: 3,
              child: Center(
                child: ListTile(
                  title: Text("Deep Cloud"),
                  leading: Icon(Icons.business),
                ),
              ),
            ),
            Text("Mobile No.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black)),
            Padding(padding: EdgeInsets.all(2)),
            Card(
              elevation: 3,
              child: Center(
                child: ListTile(
                    title: Text("+91 9191919191"), leading: Icon(Icons.call)),
              ),
            ),
            Text("Email",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black)),
            Padding(padding: EdgeInsets.all(2)),
            Card(
              elevation: 3,
              child: Center(
                child: ListTile(
                  title: Text("something@gmail.com"),
                  leading: Icon(Icons.email),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
