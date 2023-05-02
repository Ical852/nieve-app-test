import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context, "/sign-in", (route) => false
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue1,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCustom(
                  width: 120,
                  height: 120,
                  image: AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover,
                ),
                Text(
                  "Auth Apps",
                  style: megaWhiteSemibold.copyWith(
                    fontSize: 32
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}