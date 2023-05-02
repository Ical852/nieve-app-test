import 'package:nieveapptest/models/user_detail_model.dart';

class AuthResponseModel {
  late bool success;
  late String message;
  late UserDetailModel? userDetail;

  AuthResponseModel(bool success, String message, UserDetailModel? userDetail) {
    this.success = success;
    this.message = message;
    this.userDetail = userDetail;
  }
}