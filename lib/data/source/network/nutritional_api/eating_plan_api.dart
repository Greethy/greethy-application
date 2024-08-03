import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/eating_plan_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';

abstract class EatingPlanApi {
  Future<EatingPlanDto?> get(
    String id,
  );

  Future<EatingPlanDto?> post(
    EatingPlan eatingPlan,
  );

  Future<EatingPlanDto?> put(
    String id,
    EatingPlan eatingPlan,
  );
}

class EatingPlanApiImpl implements EatingPlanApi {
  final dio = Dio();

  @override
  Future<EatingPlanDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => EatingPlanDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      EatingPlanDto eatingPlanDto = await EatingPlanDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/eatting_schedule/eating_plan_final.json'));

      return eatingPlanDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return EatingPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return EatingPlanDto();
  }

  @override
  Future<EatingPlanDto?> post(EatingPlan drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => EatingPlanDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return EatingPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return EatingPlanDto();
  }

  @override
  Future<EatingPlanDto?> put(String id, EatingPlan drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => EatingPlanDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return EatingPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return EatingPlanDto();
  }
}
