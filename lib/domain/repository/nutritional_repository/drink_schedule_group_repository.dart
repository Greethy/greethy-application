import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';

abstract class DrinkScheduleGroupRepository {
  Future<DrinkScheduleGroup?> getDrinkScheduleGroup({
    required String id,
  });

  Future<DrinkScheduleGroup?> postDrinkScheduleGroup({
    required String drinkScheduleGroup,
  });

  Future<DrinkScheduleGroup?> putDrinkScheduleGroup({
    required String id,
    required DrinkScheduleGroup drinkScheduleGroup,
  });
}
