import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_schedule_group_repository.dart';

class PostDrinkScheduleGroup {
  PostDrinkScheduleGroup({
    required DrinkScheduleGroupRepository repository,
  }) : _repository = repository;

  final DrinkScheduleGroupRepository _repository;

  Future<DrinkScheduleGroup?> call({
    required DrinkScheduleGroup drinkScheduleGroup,
  }) async {
    final DrinkScheduleGroup? user = await _repository.postDrinkScheduleGroup(drinkScheduleGroup: drinkScheduleGroup);
    return user;
  }
}
