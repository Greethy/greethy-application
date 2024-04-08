import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';

abstract class DrinkPlanRepository {
  Future<DrinkPlan?> getDrinkPlan({
    required String id,
  });

  Future<DrinkPlan?> postDrinkPlan({
    required DrinkPlan drinkPlan,
  });

  Future<DrinkPlan?> putDrinkPlan({
    required String id,
    required DrinkPlan drinkPlan,
  });
}
