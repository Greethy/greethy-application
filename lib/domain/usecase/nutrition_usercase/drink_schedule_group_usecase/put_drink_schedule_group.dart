import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_schedule_group_repository.dart';

class PutDrinkScheduleGroup {
  PutDrinkScheduleGroup({
    required DrinkScheduleGroupRepository repository,
  }) : _repository = repository;

  final DrinkScheduleGroupRepository _repository;

  Future<DrinkScheduleGroup?> call({
    required DrinkScheduleGroup drinkScheduleGroup,
    required String id,
  }) async {
    final DrinkScheduleGroup? result = await _repository.putDrinkScheduleGroup(drinkScheduleGroup: drinkScheduleGroup, id: id);
    return result;
  }
}
