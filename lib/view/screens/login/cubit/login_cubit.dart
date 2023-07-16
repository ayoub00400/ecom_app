import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/prefs.dart';

import '../../../../utils/constants.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String? token;
  LoginCubit() : super(LoginInitial());
  void checkLoginStatus() async {
    token = Prefs.getString(SPKeys.userToken);
  }

  void login(String userName, String password) async {
    try {
      emit(LoginLoading());
      var token = await userApiRepo.authUser(userName, password);

      Prefs.setString(SPKeys.userToken, token);
      emit(LoginDone());
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
