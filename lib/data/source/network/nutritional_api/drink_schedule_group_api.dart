import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/drink_shedule_group_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';

abstract class DrinkScheduleGroupApi {
  Future<DrinkScheduleGroupDto?> get(
    String id,
  );

  Future<DrinkScheduleGroupDto?> post(
    DrinkScheduleGroup drinkScheduleGroup,
  );

  Future<DrinkScheduleGroupDto?> put(
    String id,
    DrinkScheduleGroup drinkScheduleGroup,
  );
}

class DrinkScheduleGroupApiImpl implements DrinkScheduleGroupApi {
  final dio = Dio();

  @override
  Future<DrinkScheduleGroupDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => DrinkScheduleGroupDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      DrinkScheduleGroupDto drinkScheduleGroupDto = await DrinkScheduleGroupDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/drink_shedule/drink_schedule_group_final.json'));

      return drinkScheduleGroupDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkScheduleGroupDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkScheduleGroupDto();
  }

  @override
  Future<DrinkScheduleGroupDto?> post(DrinkScheduleGroup drinkScheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => DrinkScheduleGroupDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkScheduleGroupDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkScheduleGroupDto();
  }

  @override
  Future<DrinkScheduleGroupDto?> put(String id, DrinkScheduleGroup drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => DrinkScheduleGroupDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return DrinkScheduleGroupDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return DrinkScheduleGroupDto();
  }
}
