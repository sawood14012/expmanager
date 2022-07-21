import 'dart:async';
import 'package:expmanager/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Hero(
          tag: 'image',
          child: Image.asset(
            'assets/images/deep1.png',
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width / 2.5,
          ),
        ),
        const Padding(padding: EdgeInsets.all(15)),
        const Hero(
          tag: 'text',
          child: Text(
            "Deep Cloud",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 114, 114),
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                fontSize: 30),
          ),
        )
      ],
    );
  }
}

