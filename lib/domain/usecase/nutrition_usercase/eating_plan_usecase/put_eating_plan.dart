import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_plan_repository.dart';

class PutEatingPlan {
  PutEatingPlan({
    required EatingPlanRepository repository,
  }) : _repository = repository;

  final EatingPlanRepository _repository;

  Future<EatingPlan?> call({
    required EatingPlan eatingPlan,
    required String id,
  }) async {
    final EatingPlan? user = await _repository.putEatingPlan(eatingPlan: eatingPlan, id: id);
    return user;
  }
}
