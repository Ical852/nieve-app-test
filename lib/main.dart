import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/cubit/user_cubit.dart';

import 'package:nieveapptest/pages/auths/sign_in.dart';
import 'package:nieveapptest/pages/auths/sign_up.dart';

import 'package:nieveapptest/pages/main/profile.dart';
import 'package:nieveapptest/pages/main/change_password.dart';
import 'package:nieveapptest/pages/main/edit_profile.dart';

import 'package:nieveapptest/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: blue1));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
    
          "/sign-in" : (context) => SignInPage(),
          "/sign-up" : (context) => SignUpPage(),
    
          "/profile" : (context) => ProfilePage(),
          "/edit-profile" : (context) => EditProfilePage(),
          "/change-password" : (context) => ChangePasswordPage()
        },
      ),
    );
  }
}
