import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../model/user.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  void initUserData(User userData) {
    emailController.text = userData.email;
    usernameController.text = userData.username;
    fullNameController.text =
        '${userData.name.firstname} ${userData.name.lastname}';
    addressController.text =
        '${userData.address.city},${userData.address.street},${userData.address.number}';
    phoneController.text = userData.phone;
    zipCodeController.text = userData.address.zipcode;
  }

  void saveDetails() {
    emit(UserDetaailsUploading());
    response =
  }
}
