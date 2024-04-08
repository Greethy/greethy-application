import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/Ingredient_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';

abstract class IngredientApi {
  Future<IngredientDto?> get(
    String id,
  );

  Future<IngredientDto?> post(
    String id,
    Ingredient password,
  );

  Future<IngredientDto?> put(
    String id,
    Ingredient password,
  );
}

class IngredientApiImpl implements IngredientApi {
  final dio = Dio();

  @override
  Future<IngredientDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => IngredientDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      IngredientDto ingredient = await IngredientDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/data/ingredient_final.json'));

      return ingredient;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return IngredientDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return IngredientDto();
  }

  @override
  Future<IngredientDto?> post(String id, Ingredient drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => IngredientDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return IngredientDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return IngredientDto();
  }

  @override
  Future<IngredientDto?> put(String id, Ingredient drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => IngredientDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return IngredientDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return IngredientDto();
  }
}
