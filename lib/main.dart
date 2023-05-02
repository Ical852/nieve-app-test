import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nieveapptest/shared/constants.dart';

import 'package:nieveapptest/pages/auths/sign_in.dart';
import 'package:nieveapptest/pages/auths/sign_up.dart';

import 'package:nieveapptest/pages/main/profile.dart';
import 'package:nieveapptest/pages/main/change_password.dart';
import 'package:nieveapptest/pages/main/edit_profile.dart';

import 'package:nieveapptest/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: blue1));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashPage(),

        "/sign-in" : (context) => SignInPage(),
        "/sign-up" : (context) => SignUpPage(),

        "/profile" : (context) => ProfilePage(),
        "/edit-profile" : (context) => EditProfilePage(),
        "/change-password" : (context) => ChangePasswordPage()
      },
    );
  }
}
