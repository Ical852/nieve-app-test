import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nieveapptest/cubit/user_cubit.dart';
import 'package:nieveapptest/models/user_detail_model.dart';
import 'package:nieveapptest/services/auth_service.dart';
import 'package:nieveapptest/shared/constants.dart';
import 'package:nieveapptest/shared/textstyle.dart';
import 'package:nieveapptest/view_models/user_view_model.dart';
import 'package:nieveapptest/widgets/buttons/main_button_custom.dart';
import 'package:nieveapptest/widgets/image_contents/image_custom.dart';
import 'package:nieveapptest/widgets/profile_items/settings_item.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late var userVm = UserViewModel(context);
  late var user = userVm.getUserData();

  void goToEditProfile() {
    Navigator.pushNamed(context, "/edit-profile");
  }
  void onLogout() async {
    await userVm.signOut();
  }

  @override
  void initState() {
    super.initState();
    userVm.checkLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    Widget HeaderBackground() {
      return Container(
        height: 183,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [blue2, blue1]
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
      );
    }

    Widget HeaderContent() {
      return BlocBuilder<UserCubit, UserDetailModel>(
        builder: (context, userDetail) {
          return Container(
              padding: EdgeInsets.all(24),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    width: double.infinity,
                    child: Text(
                      "My Profile",
                      style: regularWhiteSemibold,
                      textAlign: TextAlign.center,
                    ),
                  ),
      
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: ImageCustom(
                          margin: EdgeInsets.all(4),
                          width: 86,
                          height: 86,
                          image: AssetImage("assets/images/dummyusernull.png"),
                        ),
                      ),
      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userDetail.fullName,
                            style: mediumWhiteSemibold,
                          ),
                          SizedBox(height: 4,),
                          Text(
                            user!.email!,
                            style: regularWhiteRegular,
                          ),
                          SizedBox(height: 4,),
                          Text(
                            userDetail.phoneNumber,
                            style: regularWhiteRegular,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
        },
      );
    }

    Widget MainContent() {
      return Container(
        margin: EdgeInsets.only(top: 203),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile Settings",
              style: mediumBlackSemibold,
            ),

            SizedBox(height: 13,),

            SettingsItem(
              title: 'Edit Profile',
              desc: 'Edit your profile account',
              icon: 'pencil',
              onPressed: goToEditProfile,
            )
          ],
        ),
      );
    }

    Widget LogoutButton() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 32
          ),
          child: MainButtonCustom(
            title: "Logout",
            onPressed: onLogout,
            leftContent: ImageCustom(
              width: 20,
              height: 18,
              image: AssetImage('assets/icons/ic-logout.png'),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    HeaderBackground(),
                    HeaderContent(),
                    MainContent()
                  ],
                ),
              ),
            ),
            LogoutButton()
          ],
        ),
      ),
    );
  }
}