import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/food_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';

abstract class FoodApi {
  Future<FoodDto?> get(
    String id,
  );

  Future<FoodDto?> post(
    Food food,
  );

  Future<FoodDto?> put(
    String id,
    Food food,
  );
}

class FoodApiImpl implements FoodApi {
  final dio = Dio();

  @override
  Future<FoodDto?> get(String id) async {
    try {
      Response response;
      // response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      // final l = response.data['results'].map((e) => FoodDto.fromMap(e));
      // print(response.data);
      print("food out 1 " + id);
      FoodDto food = await FoodDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/data/food_sample/$id.json'));
      print("food out");
      print(food.toString());

      return food;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return FoodDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return FoodDto();
  }

  @override
  Future<FoodDto?> post( Food drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => FoodDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return FoodDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return FoodDto();
  }

  @override
  Future<FoodDto?> put(String id, Food drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => FoodDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return FoodDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return FoodDto();
  }
}
