import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/user_dto/user_dto.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';

abstract class UserApi {
  Future<UserDto?> get(
    String id,
  );

  Future<UserDto?> put(
    String id,
    User User,
  );
}

class UserApiImpl implements UserApi {
  final dio = Dio();

  @override
  Future<UserDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => UserDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      UserDto userDto = await UserDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/body_specs_final.json'));

      return userDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return UserDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return UserDto();
  }

  @override
  Future<UserDto?> put(String id, User User) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => UserDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return UserDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return UserDto();
  }
}
