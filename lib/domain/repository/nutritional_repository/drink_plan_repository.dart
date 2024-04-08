import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';

abstract class DrinkPlanRepository {
  Future<DrinkPlan?> postDrinkPlan({
    required String gmail,
    required String password,
    required String type,
  });

  Future<DrinkPlan?> putDrinkPlan({
    required String gmail,
    required String password,
    required String type,
  });

  Future<DrinkPlan?> getDrinkPlan({
    required String gmail,
    required String password,
    required String type,
  });
}
