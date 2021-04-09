import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  final mycolor = const Color(0xFF193283);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mycolor,
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/logo.png"),
          ),
        ));
  }
}
