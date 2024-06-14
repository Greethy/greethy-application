import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/body_dto/body_management_dto.dart';
import 'package:greethy_application/domain/entities/body_entities/body_management.dart';

abstract class BodySpecsManagementApi {
  Future<BodySpecsManagementDto?> get(
    String id,
  );

  Future<BodySpecsManagementDto?> post(
    BodySpecsManagement BodySpecsManagement,
  );

  Future<BodySpecsManagementDto?> put(
    String id,
    BodySpecsManagement BodySpecsManagement,
  );
}

class BodySpecsManagementApiImpl implements BodySpecsManagementApi {
  final dio = Dio();

  @override
  Future<BodySpecsManagementDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => BodySpecsManagementDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      BodySpecsManagementDto BodySpecsManagement = await BodySpecsManagementDto.fromRawJson(await rootBundle.loadString('assets/database_sample/BodySpecsal/BodySpecsal_management_final.json'));

      return BodySpecsManagement;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return BodySpecsManagementDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return BodySpecsManagementDto();
  }

  @override
  Future<BodySpecsManagementDto?> post(BodySpecsManagement drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => BodySpecsManagementDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return BodySpecsManagementDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return BodySpecsManagementDto();
  }

  @override
  Future<BodySpecsManagementDto?> put(String id, BodySpecsManagement drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => BodySpecsManagementDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return BodySpecsManagementDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return BodySpecsManagementDto();
  }
}
