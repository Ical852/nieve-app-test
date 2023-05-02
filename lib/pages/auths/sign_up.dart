import 'package:flutter/material.dart';
import 'package:nieveapptest/functions/global_func.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/view_models/user_view_model.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/headers/action_header.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/text_inputs/main_input_custom.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late var userVm = UserViewModel(context);
  TextEditingController fullNameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneNumberController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  void onSignUp() async {
    if (isDisabled()) {
      showGLobalAlert('danger', 'Complete your form first!', context);
    } else {
      var result = await userVm.signUp(
        email: emailController.text,
        password: passwordController.text,
        fullName: fullNameController.text,
        phoneNumber: phoneNumberController.text
      );
      if (result) {
        Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
      }
    }
  }
  bool isDisabled() {
    return fullNameController.text == "" ||
      emailController.text == "" ||
      phoneNumberController.text == "" ||
      passwordController.text == "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                  padding: EdgeInsets.all(32),
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
                      inputType: TextInputType.number,
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
                      onPressed: onSignUp,
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