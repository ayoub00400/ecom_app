import 'package:bloc/bloc.dart';
import '../../../../utils/prefs.dart';
import 'package:meta/meta.dart';

import '../../../../utils/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String? token;
  LoginCubit() : super(LoginInitial());
  void checkLoginStatus() async {
    token = Prefs.getString(SPKeys.userToken);
    print(token);
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
}
