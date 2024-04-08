import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/eating_shedule_group_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';

abstract class EatingScheduleGroupApi {
  Future<EatingScheduleGroupDto?> get(
    String id,
  );

  Future<EatingScheduleGroupDto?> post(
    EatingScheduleGroup eatingScheduleGroup,
  );

  Future<EatingScheduleGroupDto?> put(
    String id,
    EatingScheduleGroup eatingScheduleGroup,
  );
}

class EatingScheduleGroupApiImpl implements EatingScheduleGroupApi {
  final dio = Dio();

  @override
  Future<EatingScheduleGroupDto?> get(String id) async {
    try {
      id = "1";
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=$id');

      final l = response.data['results'].map((e) => EatingScheduleGroupDto.fromMap(e));
      print(response.data);

      // return l;
      // todo: add to test

      EatingScheduleGroupDto eatingScheduleGroupDto = await EatingScheduleGroupDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/eatting_schedule/eating_schedule_group_final.json'));

      return eatingScheduleGroupDto;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return EatingScheduleGroupDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return EatingScheduleGroupDto();
  }

  @override
  Future<EatingScheduleGroupDto?> post(EatingScheduleGroup drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => EatingScheduleGroupDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return EatingScheduleGroupDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return EatingScheduleGroupDto();
  }

  @override
  Future<EatingScheduleGroupDto?> put(String id, EatingScheduleGroup drinkSheduleGroup) async {
    try {
      Response response;
      response = await dio.get('https://rickandmortyapi.com/api/character/?id=2');

      final l = response.data['results'].map((e) => EatingScheduleGroupDto.fromMap(e));

      return l;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return EatingScheduleGroupDto();
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    return EatingScheduleGroupDto();
  }
}
