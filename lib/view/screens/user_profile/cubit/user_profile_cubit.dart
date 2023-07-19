import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../utils/prefs.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());

  Future<void> logOut() async {
    await Prefs.remove(SPKeys.userToken);
    await Prefs.remove(SPKeys.userData);
    emit(LogOut());
  }
}
