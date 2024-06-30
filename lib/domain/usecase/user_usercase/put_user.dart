import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/user_reposotory/user_repository.dart';

class PutUser {
  PutUser({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  Future<User?> call({
    required User user,
    required String id,
  }) async {
    final User? result = await _repository.putUser(user: user, id: id);
    return result;
  }
}
