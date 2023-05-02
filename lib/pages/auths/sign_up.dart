import 'package:flutter/material.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/headers/action_header.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/text_inputs/main_input_custom.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneNumberController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ActionHeader(
                title: "Sign Up",
                desc: "sign up and start to buy shoes",
              ),
          
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 32
                  ),
                  children: [
                    ImageCustom(
                      height: 250,
                      width: 250,
                      image: AssetImage('assets/images/sign-up.png'),
                      margin: EdgeInsets.only(bottom: 32),
                    ),

                    MainInputCustom(
                      controller: fullNameController,
                      hint: "Masukkan Full Name",
                      title: "Full Name",
                    ),
                    SizedBox(height: 20,),
                    MainInputCustom(
                      controller: emailController,
                      hint: "Masukkan Email Address",
                      title: "Email Address",
                    ),
                    SizedBox(height: 20,),
                    MainInputCustom(
                      controller: phoneNumberController,
                      hint: "Masukkan Phone Number",
                      title: "Phone Number",
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
                      title: "Sign Up",
                      onPressed: () {},
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