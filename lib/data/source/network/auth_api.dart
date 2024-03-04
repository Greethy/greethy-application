import 'package:dio/dio.dart';
import 'package:greethy_application/data/dto/user_dto/user_dto.dart';

abstract class AuthApi {
  Future<UserDto> signIn(
    String gmail,
    String password,
    String type,
  );

  Future<UserDto> signUp(
    String gmail,
    String password,
    String type,
  );
}

class AuthApiImpl implements AuthApi {
  final dio = Dio();

  @override
  Future<UserDto> signIn(String gmail, String password, String type) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<UserDto> signUp(String gmail, String password, String type) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
