import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvp_monaghese/AnimationHandler.dart';
import 'package:mvp_monaghese/Helpers.dart';

import 'SearchView.dart';
import 'Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SearchView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Hero(
              tag: 'bg',
              child: Container(
                color: primaryColor,
              ),
            ),
            // top: 0,
            // left: 0,
            // bottom: 0,
            // right: 0,
          ),
          Container(
            child: Center(
              child: AnimationHandler().popUp(
                Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: 150,
                      color: Colors.white,
                    )),
                Curves.elasticOut,
                0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
