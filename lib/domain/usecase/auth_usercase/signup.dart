import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/auth_repository.dart';

class CaseSignUp {
  CaseSignUp({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  Future<User?> call({
    required String gmail,
    required String password,
    required String type,
  }) async {
    final User? user = await _repository.signUp(gmail: gmail, password: password, type: type);
    return user;
  }
}
