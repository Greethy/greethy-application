import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/drink_plan_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';

abstract class DrinkPlanApi {
  Future<DrinkPlanDto?> get(
    String id,
  );

  Future<DrinkPlanDto?> post(
    DrinkPlan drinkPlan,
  );

  Future<DrinkPlanDto?> postIncreaseWater();

  Future<DrinkPlanDto?> postReduceWater();

  Future<DrinkPlanDto?> put(
    String id,
    DrinkPlan drinkPlan,
  );
}

class DrinkPlanApiImpl implements DrinkPlanApi {
  final dio = Dio();

  @override
  Future<DrinkPlanDto?> postIncreaseWater() async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=1');

      final l = response.data['results'].map((e) => DrinkPlanDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      DrinkPlanDto drinkPlanDto = await DrinkPlanDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/drink_shedule/drink_plan_final2.json'));

      return drinkPlanDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkPlanDto();
  }

  @override
  Future<DrinkPlanDto?> postReduceWater() async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=1');

      final l = response.data['results'].map((e) => DrinkPlanDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      DrinkPlanDto drinkPlanDto = await DrinkPlanDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/drink_shedule/drink_plan_final.json'));

      return drinkPlanDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkPlanDto();
  }

  @override
  Future<DrinkPlanDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => DrinkPlanDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      DrinkPlanDto drinkPlanDto = await DrinkPlanDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/drink_shedule/drink_plan_final.json'));

      return drinkPlanDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkPlanDto();
  }

  @override
  Future<DrinkPlanDto?> post(DrinkPlan drinkPlan) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => DrinkPlanDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkPlanDto();
  }

  @override
  Future<DrinkPlanDto?> put(String id, DrinkPlan drinkPlan) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => DrinkPlanDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkPlanDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkPlanDto();
  }
}
