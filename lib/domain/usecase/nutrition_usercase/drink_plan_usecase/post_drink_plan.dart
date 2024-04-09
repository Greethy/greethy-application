import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/body_specs_repository.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_plan_repository.dart';

class PostDrinkPlan {
  PostDrinkPlan({
    required DrinkPlanRepository repository,
  }) : _repository = repository;

  final DrinkPlanRepository _repository;

  Future<DrinkPlan?> call({
    required DrinkPlan drinkPlan,
  }) async {
    final DrinkPlan? user = await _repository.postDrinkPlan(drinkPlan: drinkPlan);
    return user;
  }
}
