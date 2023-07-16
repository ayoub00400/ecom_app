import 'dart:convert';

import 'package:http/http.dart';

import '../../../model/user.dart';
import '../../../utils/urls.dart';
import 'user_repo.dart';

class UserRepoImp implements IUserRepository {
  @override
  Future<String> authUser(String username, String password) async {
    try {
      Map<String, dynamic> accessToken;

      var response = await post(
        Uri.parse(ApiHelper.authUser),
        body: {'username': username, 'password': password},
      );

      accessToken = jsonDecode(response.body);
      return accessToken['token'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User> getUser(int userId) async {
    try {
      User user;
      var response = await get(Uri.parse('${ApiHelper.userData}/$userId'));
      var decodedResponse = json.decode(response.body);
      user = User.fromJson(decodedResponse);
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> updateUserDetails(int userId, Map<String, dynamic> body) async {
    try {
      var response = await put(
        Uri.parse(
          '${ApiHelper.userData}/$userId',
        ),
        body: body,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('bad request');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
