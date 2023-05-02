class UserDetailModel {
  String fullName = "";
  String phoneNumber = "";

  UserDetailModel.init();

  UserDetailModel(String fullName, String phoneNumber) {
    this.fullName = fullName;
    this.phoneNumber = phoneNumber;
  }
}