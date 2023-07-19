import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/user.dart';
import '../../../../utils/prefs.dart';

import '../../../../utils/constants.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String? token;
  User? userData;
  LoginCubit() : super(LoginInitial());
  void getLoginCredantials() async {
    token = Prefs.getString(SPKeys.userToken);
    var rawUserData = Prefs.getString(SPKeys.userData);
    userData = rawUserData != null ? User.fromJson(jsonDecode(rawUserData)) : null;
  }

  void login(String userName, String password) async {
    try {
      emit(LoginLoading());
      token = await Constants.userApiRepo.authUser(userName, password);
      userData = await Constants.userApiRepo.getUser(1);

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
