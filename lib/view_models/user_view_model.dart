import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nieveapptest/cubit/user_cubit.dart';
import 'package:nieveapptest/functions/global_func.dart';
import 'package:nieveapptest/models/user_detail_model.dart';
import 'package:nieveapptest/services/auth_service.dart';

class UserViewModel {
  late BuildContext context;
  late AuthService authService;

  UserViewModel(BuildContext context) {
    this.context = context;
    authService = AuthService();
  }

  void setUserDetailData(UserDetailModel user) {
    context.read<UserCubit>().setUserData(user);
  }

  UserDetailModel getUserDetailData() {
    return context.read<UserCubit>().state;
  }

  User? getUserData() {
    return authService.currentUser;
  }

  void checkLoggedIn() {
    if (authService.currentUser == null) {
      showGLobalAlert('danger', 'Sign In First!', context);
      Navigator.pushNamedAndRemoveUntil(context, "/sign-in", (route) => false);
    }
  }

  Future<bool> signIn({
    required String email,
    required String password
  }) async {
    try {
      var result = await authService.signInWithEmailAndPassword(
        email: email, password: password
      );

      if (result.success) {
        showGLobalAlert("success", result.message, context);
        this.setUserDetailData(result.userDetail!);
        return true;
      }

      showGLobalAlert("danger", result.message, context);
      return false;
    } catch (e) {
      showGLobalAlert('danger', "Sign In Failed", context);
      return false;      
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      var result = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber
      );

      if (result.success) {
        showGLobalAlert("success", result.message, context);
        this.setUserDetailData(result.userDetail!);
        return true;
      }

      showGLobalAlert("danger", result.message, context);
      return false;
    } catch (e) {
      showGLobalAlert('danger', "Sign Up Failed", context);
      return false;      
    }
  }

  Future<void> signOut() async {
    showGLobalAlert("success", "Sign Out Success", context);
    await authService.signOut();
    Navigator.pushNamedAndRemoveUntil(context, "/sign-in", (route) => false);
  }

  Future<void> fetchUser() async {
    try {
      var result = await authService.fetchUserData();
      if (result != null) {
        this.setUserDetailData(result);
      }
    } catch (e) {
      showGLobalAlert("danger", "Failed to fetch User Data, Sign In!", context);
      Navigator.pushNamedAndRemoveUntil(context, "/sign-in", (route) => false);
    }
  }

  Future<bool> updateUser({
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      var result  = await authService.updateUserData(
        fullName: fullName,
        phoneNumber: phoneNumber
      );

      if (result) {
        showGLobalAlert('success', "Update User Data Success", context);
        var userDetail = UserDetailModel(fullName, phoneNumber);
        this.setUserDetailData(userDetail);

        return true;
      }

      showGLobalAlert("danger", "Failed to update User Data!", context);
      return false;
    } catch (e) {
      showGLobalAlert("danger", "Failed to update User Data!", context);
      return false;
    }
  }

  Future<bool> updatePassword({
    required String oldPassword,
    required String newPassword
  }) async {
    try {
      var result = await authService.changePassword(oldPassword: oldPassword, newPassword: newPassword);
      if (result.success) {
        showGLobalAlert('success', "Change Password Success", context);
        return true;
      }

      showGLobalAlert('danger', "Change Password Failed", context);
      return false;
    } catch (e) {
      showGLobalAlert('danger', "Change Password Failed", context);
      return false;
    }
  }
}