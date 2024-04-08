import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/body_specs_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';

abstract class BodySpecsApi {
  Future<BodySpecsDto?> get(
    String id,
  );

  Future<BodySpecsDto?> post(
    String id,
    BodySpecs password,
  );

  Future<BodySpecsDto?> put(
    String id,
    BodySpecs password,
  );
}

class BodySpecsApiImpl implements BodySpecsApi {
  final dio = Dio();

  @override
  Future<BodySpecsDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => BodySpecsDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      BodySpecsDto bodySpecsDto = await BodySpecsDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/body_specs_final.json'));

      return bodySpecsDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return BodySpecsDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return BodySpecsDto();
  }

  @override
  Future<BodySpecsDto?> post(String id, BodySpecs bodySpecs) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => BodySpecsDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return BodySpecsDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return BodySpecsDto();
  }

  @override
  Future<BodySpecsDto?> put(String id, BodySpecs bodySpecs) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => BodySpecsDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return BodySpecsDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return BodySpecsDto();
  }
}
