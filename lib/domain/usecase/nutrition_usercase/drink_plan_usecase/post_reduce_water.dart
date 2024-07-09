import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_plan_repository.dart';

class CasePostReduceWater {
  CasePostReduceWater({
    required DrinkPlanRepository repository,
  }) : _repository = repository;

  final DrinkPlanRepository _repository;

  Future<DrinkPlan?> call() async {
    final DrinkPlan? reduce = await _repository.postReduceWater();
    return reduce;
  }
}
