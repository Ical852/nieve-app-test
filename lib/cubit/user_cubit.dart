import 'package:bloc/bloc.dart';
import 'package:nieveapptest/models/user_detail_model.dart';

class UserCubit extends Cubit<UserDetailModel> {
  UserCubit() : super(UserDetailModel.init());

  void setUserData(UserDetailModel user) {
    emit(user);
  }
}
