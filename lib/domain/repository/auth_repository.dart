import 'package:greethy_application/domain/entities/user_entities/user.dart';

abstract class AuthRepository {
  Future<User?> signIn({
    required String gmail,
    required String password,
    required String type,
  });

  Future<User?> signUp({
    required String gmail,
    required String password,
    required String type,
  });

  Future<String> getLoginStatus();

  Future<void> saveLoginStatus(String status);
}
