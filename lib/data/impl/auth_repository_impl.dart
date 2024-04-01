import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/auth_api.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;
  final LocalStorageUser _localStorage;

  AuthRepositoryImpl({
    required AuthApi api,
    required LocalStorageUser localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<String> getLoginStatus() async {
    final String status = await _localStorage.getLoginStatus();
    return status;
  }

  @override
  Future<bool> saveLoginStatus(String status) async {
    return _localStorage.saveLoginStatus(status: status);
  }

  @override
  Future<User?> signIn({required String gmail, required String password, required String type}) async {
    final UserDto? fetched = await _api.signIn(gmail, password, type );
    if (fetched?.id != null){
      await _localStorage.saveUser(id: fetched!.id!, user: fetched);
    }
    return fetched == null ? null : fetched.toUser();
  }

  @override
  Future<User?> signUp({required String gmail, required String password, required String type}) async {
    final UserDto? fetched = await _api.signUp(gmail, password, type );
    if (fetched?.id != null){
      await _localStorage.saveUser(id: fetched!.id!, user: fetched);
    }
    return fetched == null ? null : fetched.toUser();
  }
}
