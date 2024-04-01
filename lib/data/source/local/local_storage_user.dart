import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedUserKey = 'CACHED_USER';
const cachedSignInKey = 'SIGN_IN_STATUS';

abstract class LocalStorageUser {
  Future<bool> saveUser({
    required String id,
    required UserDto user,
  });

  UserDto loadUser({
    required String id,
  });

  Future<String> getLoginStatus();

  Future<bool> saveLoginStatus({
    required String status,
  });
}

class LocalStorageUserImpl implements LocalStorageUser {
  final SharedPreferences _sharedPref;

  LocalStorageUserImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  @override
  UserDto loadUser({required String id}) {
    final String key = getKeyToUser(id);
    final String? json = _sharedPref.getString(key);

    return json != null ? UserDto.fromRawJson(json) : UserDto();
  }

  @override
  Future<bool> saveUser({
    required String id,
    required UserDto user,
  }) {
    final json = user.toRawJson();
    final key = getKeyToUser(id);
    return _sharedPref.setString(key, json);
  }

  @visibleForTesting
  static String getKeyToUser(String id) {
    return '${cachedUserKey}_$id';
  }

  @override
  Future<String> getLoginStatus() async {
    final String status = _sharedPref.getString(cachedSignInKey) ?? '';
    return status;
  }


  @override
  Future<bool> saveLoginStatus({required String status}) async {
    return _sharedPref.setString(cachedSignInKey, status);
  }
}
