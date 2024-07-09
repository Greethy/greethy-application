import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/user_reposotory/user_repository.dart';

class CaseGetUser {
  CaseGetUser({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  Future<User?> call({String id = "0"}) async {
    final list = await _repository.getUser(id: id);
    return list;
  }
}
