import 'package:greethy_application/domain/repository/auth_repository.dart';

class SaveStatusLogin {
  SaveStatusLogin({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  Future<void> call(String type) async {
    await _repository.saveLoginStatus(type);
  }
}
