import 'package:greethy_application/domain/entities/user_entities/user.dart';

abstract class UserRepository {
  Future<User?> getUser({required String id});

  Future<User?> putUser({
    required String id,
    required User user,
  });
}
