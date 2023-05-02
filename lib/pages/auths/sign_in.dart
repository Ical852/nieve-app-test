import 'package:flutter/material.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/headers/stack_header.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/text_inputs/main_input_custom.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  void goToSignUp() {
    Navigator.pushNamed(context, "/sign-up");
  }

  void signIn() {
    Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 32
                  ),
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
                      onPressed: signIn,
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