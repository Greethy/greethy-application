import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/user_api/user_api.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/user_reposotory/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _api;
  final LocalStorageUser _localStorage;

  UserRepositoryImpl({
    required UserApi api,
    required LocalStorageUser localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  Future<User?> getUser({required String id}) async {
    final UserDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toUser();
  }

  @override
  Future<User?> putUser({required String id, required User user}) async {
    final UserDto? fetched = await _api.put(id, user);
    return fetched == null ? null : fetched.toUser();
  }
}
