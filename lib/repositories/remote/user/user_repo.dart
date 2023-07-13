import '../../../model/user.dart';

abstract class IUserRepository {
  Future<String> authUser(String username, String password);
  Future<User> getUser(int userId);
}