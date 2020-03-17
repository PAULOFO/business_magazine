import 'package:businessmagazine/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () =>
        Navigator.push(
            context, MaterialPageRoute(builder: (BuildContext context) {
          return BaseScreen();
        })));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF692CD5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/olx_icon.jpg"),
        ],
      ),
    );
  }
}
