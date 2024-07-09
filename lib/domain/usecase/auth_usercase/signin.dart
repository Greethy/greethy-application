import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/auth_repository.dart';

class CaseSignIn {
  CaseSignIn({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  Future<User?> call({
    required String gmail,
    required String password,
    required String type,
  }) async {
    final User? user = await _repository.signIn(gmail: gmail, password: password, type: type);
    return user;
  }
}
