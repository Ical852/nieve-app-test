import 'package:flutter/material.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/view_models/user_view_model.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/headers/action_header.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/text_inputs/main_input_custom.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late var userVm = UserViewModel(context);
  late var user = userVm.getUserData();
  late var userDetail = userVm.getUserDetailData();

  late TextEditingController fullNameController = TextEditingController(text: userDetail.fullName);
  late TextEditingController emailController = TextEditingController(text: user!.email!);
  late TextEditingController phoneNumberController = TextEditingController(text: userDetail.phoneNumber);

  void updateProfile() async {
    var result = await userVm.updateUser(
      fullName: fullNameController.text,
      phoneNumber: phoneNumberController.text
    );
    if (result) {
      Navigator.pop(context);
    }
  }
  void goToChangePassword() {
    Navigator.pushNamed(context, "/change-password");
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
                title: "Edit Profile",
                desc: "update your profile data here",
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(32),
                  children: [
                    ImageCustom(
                      height: 250,
                      width: 250,
                      image: AssetImage("assets/images/edit-profile.png"),
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
                      enabled: false,
                    ),
                    SizedBox(height: 20,),
                    MainInputCustom(
                      controller: phoneNumberController,
                      hint: "Masukkan Phone Number",
                      title: "Phone Number",
                      inputType: TextInputType.number,
                    ),
                    SizedBox(height: 24,),

                    MainButtonCustom(
                      title: "Save",
                      onPressed: updateProfile,
                    ),
                    SizedBox(height: 16,),
                    MainButtonCustom(
                      title: "Change Password",
                      onPressed: goToChangePassword,
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