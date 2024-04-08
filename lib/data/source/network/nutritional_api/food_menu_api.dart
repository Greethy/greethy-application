import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/food_menu_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';

abstract class FoodMenuApi {
  Future<FoodMenuDto?> get(
    String id,
  );

  Future<FoodMenuDto?> post(
    FoodMenu foodMenu,
  );

  Future<FoodMenuDto?> put(
    String id,
    FoodMenu foodMenu,
  );
}

class FoodMenuApiImpl implements FoodMenuApi {
  final dio = Dio();

  @override
  Future<FoodMenuDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => FoodMenuDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      FoodMenuDto foodMenu = await FoodMenuDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/data/food_Menu_final.json'));

      return foodMenu;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return FoodMenuDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return FoodMenuDto();
  }

  @override
  Future<FoodMenuDto?> post(FoodMenu drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => FoodMenuDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return FoodMenuDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return FoodMenuDto();
  }

  @override
  Future<FoodMenuDto?> put(String id, FoodMenu drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => FoodMenuDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return FoodMenuDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return FoodMenuDto();
  }
}
