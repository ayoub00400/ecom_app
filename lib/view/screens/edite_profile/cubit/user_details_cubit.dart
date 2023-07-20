import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../model/user.dart';
import '../../../../repositories/remote/user/user_repo_imp.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserRepoImp userApiRepo = UserRepoImp();
  User? userData;
  UserDetailsCubit() : super(UserDetailsInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  void initUserData(User userData) {
    this.userData = userData;
    emailController.text = this.userData!.email;
    userNameController.text = this.userData!.username;
    fullNameController.text =
        '${this.userData!.name.firstname} ${this.userData!.name.lastname}';
    addressController.text =
        '${this.userData!.address.city},${this.userData!.address.street},${this.userData!.address.number}';
    phoneController.text = this.userData!.phone;
    zipCodeController.text = this.userData!.address.zipcode;
  }

  void saveDetails(int userId) async {
    emit(UserDetailsUploading());
    try {
      await userApiRepo.updateUserDetails(
          userId: userId, body: putEditedData());

      emit(UserDetailsUploadingDone());
    } catch (e) {
      emit(UserDetailsUploadingFailed());
    }
  }

  String putEditedData() {
    List<String> address = addressController.text.split(',');
    List<String> fullName = fullNameController.text.split(' ');
    return json.encode({
      'address': {
        'geolocation': {'lat': '-37.3159', 'long': '81.1496'},
        'city': address[0],
        'street': address[1],
        'number': int.parse(address[2]),
        'zipcode': '12926-3874'
      },
      'id': userData!.id,
      'email': emailController.text,
      'username': userNameController.text,
      'password': 'm38rmF\$',
      'name': Name(firstname: fullName[0], lastname: fullName[1]).toJson(),
      'phone': phoneController.text,
      '__v': 0,
    });
  }
}
