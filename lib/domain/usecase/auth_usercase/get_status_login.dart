import 'package:greethy_application/domain/repository/auth_repository.dart';

class GetStatusLogin {
  GetStatusLogin({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  Future<String> call() async {
    final String status = await _repository.getLoginStatus();
    return status;
  }
}