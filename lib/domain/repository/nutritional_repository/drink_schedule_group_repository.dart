import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';

abstract class AuthRepository {
  Future<DrinkScheduleGroup?> postDrinkScheduleGroup({
    required String gmail,
    required String password,
    required String type,
  });

  Future<DrinkScheduleGroup?> putDrinkScheduleGroup({
    required String gmail,
    required String password,
    required String type,
  });

  Future<DrinkScheduleGroup?> getDrinkScheduleGroup({
    required String gmail,
    required String password,
    required String type,
  });
}
