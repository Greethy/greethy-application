import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_plan_repository.dart';

class CasePostEatingPlan {
  CasePostEatingPlan({
    required EatingPlanRepository repository,
  }) : _repository = repository;

  final EatingPlanRepository _repository;

  Future<EatingPlan?> call({
    required EatingPlan eatingPlan,
  }) async {
    final EatingPlan? result = await _repository.postEatingPlan(eatingPlan: eatingPlan);
    return result;
  }
}
