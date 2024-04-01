import 'package:greethy_application/domain/entities/user_entities/user.dart';

abstract class UserRepository {
  Future<User?> getUsers({String id = "int"});
}
