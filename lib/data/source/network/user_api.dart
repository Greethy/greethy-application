import 'package:dio/dio.dart';
import 'package:greethy_application/data/dto/user_dto/user_dto.dart';

abstract class UserApi {
  Future<UserDto> loadUser({String id = "0"});
}

class UserApiImpl implements UserApi {
  final dio = Dio();

  @override
  Future<UserDto> loadUser({String id = "asd"}) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

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
