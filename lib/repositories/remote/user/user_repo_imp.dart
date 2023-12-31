import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/user.dart';
import '../../../utils/urls.dart';
import 'user_repo.dart';

class UserRepoImp implements IUserRepository {
  @override
  Future<String> authUser(String username, String password) async {
    try {
      Map<String, dynamic> accessToken;

      var response = await http.post(
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
      var response = await http.get(Uri.parse('${ApiHelper.userData}/$userId'));
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        user = User.fromJson(decodedResponse);
        return user;
      } else {
        throw Exception('bad request');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> updateUserDetails(
      {required int userId, required String body}) async {
    try {
      var response = await http.put(
        Uri.parse(
          '${ApiHelper.userData}/$userId',
        ),
        body: body,
      );
      if (response.statusCode == 200) {
        //print(response.statusCode);
        return true;
      } else {
        throw Exception('bad request');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
