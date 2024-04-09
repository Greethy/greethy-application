import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/user_api.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';
import 'package:greethy_application/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _api;
  final LocalStorageUser _localStorage;

  UserRepositoryImpl({
    required UserApi api,
    required LocalStorageUser localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<User> getUsers({String? id = null}) async {
    if (id == "" || id == null) {
      final UserDto cached = _localStorage.loadUser();
      return cached;
    } else {
      final fetched = await _api.loadUser(id: id);
      await _localStorage.saveUser(id: id, user: fetched);
      return fetched;
    }
  }
}
