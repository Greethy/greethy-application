import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_schedule_group_repository.dart';

class GetDrinkScheduleGroup {
  GetDrinkScheduleGroup({
    required DrinkScheduleGroupRepository repository,
  }) : _repository = repository;

  final DrinkScheduleGroupRepository _repository;

  Future<DrinkScheduleGroup?> call({
    required String id,
  }) async {
    final DrinkScheduleGroup? user = await _repository.getDrinkScheduleGroup(id: id);
    return user;
  }
}
