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

      var response = await post(Uri.parse(ApiHelper.authUser), body: {'username': username, 'password': password});

      accessToken = jsonDecode(response.body);
      return accessToken['token'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User> getUser(int userId) async {
    try {} catch (e) {}
    late User user;
    var response = await get(Uri.parse('${ApiHelper.userData}/$userId'));
    var decodedResponse = json.decode(response.body);
    user = User.fromJson(decodedResponse);
    return user;
  }
}
