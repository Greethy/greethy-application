import 'package:greethy_application/data/dto/nutrition_dto/drink_shedule_group_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/drink_schedule_group_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_schedule_group_repository.dart';

class DrinkScheduleGroupRepositoryImpl implements DrinkScheduleGroupRepository {
  final DrinkScheduleGroupApi _api;

  DrinkScheduleGroupRepositoryImpl({
    required DrinkScheduleGroupApi api,
  }) : _api = api;

  @override
  Future<DrinkScheduleGroup?> getDrinkScheduleGroup({required String id}) async {
    final DrinkScheduleGroupDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toDrinkScheduleGroup();
  }

  @override
  Future<DrinkScheduleGroup?> postDrinkScheduleGroup({required DrinkScheduleGroup drinkScheduleGroup}) async {
    final DrinkScheduleGroupDto? fetched = await _api.post(drinkScheduleGroup);
    return fetched == null ? null : fetched.toDrinkScheduleGroup();
  }

  @override
  Future<DrinkScheduleGroup?> putDrinkScheduleGroup({required String id, required DrinkScheduleGroup drinkScheduleGroup}) async {
    final DrinkScheduleGroupDto? fetched = await _api.put(id, drinkScheduleGroup);
    return fetched == null ? null : fetched.toDrinkScheduleGroup();
  }
}
