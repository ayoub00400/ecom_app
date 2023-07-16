import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecom_app/model/user.dart';
import '../../../../utils/prefs.dart';

import '../../../../utils/constants.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String? token;
  User? userData;
  LoginCubit() : super(LoginInitial());
  void getLoginCredantials() async {
    token = Prefs.getString(SPKeys.userToken);
    userData = User.fromJson(jsonDecode(Prefs.getString(SPKeys.userData)!));
  }

  void login(String userName, String password) async {
    try {
      emit(LoginLoading());
      token = await userApiRepo.authUser(userName, password);
      userData = await userApiRepo.getUser(1);

      if (token != null && userData != null) {
        Prefs.setString(SPKeys.userToken, token!);
        Prefs.setString(SPKeys.userData, userData!.toJson());
        emit(LoginDone());
      }
    } catch (e) {
      if (e is Exception) {
        emit(LoginError('login error please try later.'));
      } else {
        emit(LoginFailed());
      }
    }
  }

  Future<void> logOut() async {
    await Prefs.clear();
    emit(LogOut());
  }
}
