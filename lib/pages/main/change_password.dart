import 'package:flutter/material.dart';
import 'package:nieveapptest/functions/global_func.dart';
import 'package:nieveapptest/services/auth_service.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/view_models/user_view_model.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/headers/action_header.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/text_inputs/main_input_custom.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late var userVm = UserViewModel(context);
  TextEditingController oldPasswordController = TextEditingController(text: "");
  TextEditingController newPasswordController = TextEditingController(text: "");
  TextEditingController confirmNewPasswordController = TextEditingController(text: "");

  void changePassword() async {
    if (isDisabled()) {
      showGLobalAlert("danger", "Complete your form first!", context);
    } else {
      if (newPasswordController.text != confirmNewPasswordController.text) {
        showGLobalAlert("danger", "New Password and Confirm Password Doesn't Match", context);
      } else {
        var result = await userVm.updatePassword(
          oldPassword: oldPasswordController.text,
          newPassword: newPasswordController.text
        );
        if (result) {
          Navigator.pop(context);
        }
      }
    }
  }
  bool isDisabled() {
    return oldPasswordController.text == "" || newPasswordController.text == "" || confirmNewPasswordController.text == "";
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
                title: "Change Password",
                desc: "update your password here",
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(32),
                  children: [
                    ImageCustom(
                      height: 250,
                      width: 250,
                      image: AssetImage("assets/images/change-password.png"),
                      margin: EdgeInsets.only(bottom: 32),
                    ),

                    MainInputCustom(
                      controller: oldPasswordController,
                      hint: "Masukkan Password Terkini",
                      title: "Password Terkini",
                      password: true,
                    ),
                    SizedBox(height: 20,),
                    MainInputCustom(
                      controller: newPasswordController,
                      hint: "Masukkan Password Baru",
                      title: "Password Baru",
                      password: true,
                    ),
                    SizedBox(height: 20,),
                    MainInputCustom(
                      controller: confirmNewPasswordController,
                      hint: "Masukkan Confirm Password Baru",
                      title: "Confirm Password Baru",
                      password: true,
                    ),
                    SizedBox(height: 24,),

                    MainButtonCustom(
                      title: "Save",
                      onPressed: changePassword,
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