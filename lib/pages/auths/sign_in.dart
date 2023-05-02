import 'package:flutter/material.dart';
import 'package:nieveapptest/functions/global_func.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/view_models/user_view_model.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/headers/stack_header.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/text_inputs/main_input_custom.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late var userVm = UserViewModel(context);
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  void goToSignUp() {
    Navigator.pushNamed(context, "/sign-up");
  }
  void onSignIn() async {
    if (isDisabled()) {
      showGLobalAlert("danger", "Complete your form first!", context);
    } else {
      var result = await userVm.signIn(
        email: emailController.text, password: passwordController.text
      );
      if (result) {
        Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
      }
    }
  }
  bool isDisabled() {
    return emailController.text == "" || passwordController.text == "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              StackHeader(
                title: "Sign In",
                desc: "Sign in to continue to apps",
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(32),
                  children: [
                    ImageCustom(
                      width: 250,
                      height: 250,
                      image: AssetImage('assets/images/sign-in.png'),
                      margin: EdgeInsets.only(bottom: 32),
                    ),
                    
                    MainInputCustom(
                      controller: emailController,
                      hint: "Masukkan Email Address",
                      title: "Email Address",
                    ),
                    SizedBox(height: 20,),
                    MainInputCustom(
                      controller: passwordController,
                      hint: "Masukkan Password",
                      title: "Password",
                      password: true,
                    ),
                    SizedBox(height: 24,),

                    MainButtonCustom(
                      title: "Sign In",
                      onPressed: onSignIn,
                    ),
                    SizedBox(height: 16,),
                    MainButtonCustom(
                      title: "Sign Up",
                      onPressed: goToSignUp,
                      type: "secondary",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}