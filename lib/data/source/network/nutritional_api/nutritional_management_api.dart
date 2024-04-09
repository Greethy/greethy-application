import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/nutrition_management_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';

abstract class NutritionManagementApi {
  Future<NutritionManagementDto?> get(
    String id,
  );

  Future<NutritionManagementDto?> post(
    NutritionManagement nutritionManagement,
  );

  Future<NutritionManagementDto?> put(
    String id,
    NutritionManagement nutritionManagement,
  );
}

class NutritionManagementApiImpl implements NutritionManagementApi {
  final dio = Dio();

  @override
  Future<NutritionManagementDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => NutritionManagementDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      NutritionManagementDto nutritionManagement = await NutritionManagementDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/nutritional_management_final.json'));

      return nutritionManagement;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return NutritionManagementDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return NutritionManagementDto();
  }

  @override
  Future<NutritionManagementDto?> post(NutritionManagement drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => NutritionManagementDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return NutritionManagementDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return NutritionManagementDto();
  }

  @override
  Future<NutritionManagementDto?> put(String id, NutritionManagement drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => NutritionManagementDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return NutritionManagementDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return NutritionManagementDto();
  }
}
