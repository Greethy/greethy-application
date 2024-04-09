import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_plan_repository.dart';

class GetDrinkPlan {
  GetDrinkPlan({
    required DrinkPlanRepository repository,
  }) : _repository = repository;

  final DrinkPlanRepository _repository;

  Future<DrinkPlan?> call({
    required String id,
  }) async {
    final DrinkPlan? user = await _repository.getDrinkPlan(id: id);
    return user;
  }
}