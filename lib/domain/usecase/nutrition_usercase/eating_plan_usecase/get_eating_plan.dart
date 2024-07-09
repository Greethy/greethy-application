import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_plan_repository.dart';

class CaseGetEatingPlan {
  CaseGetEatingPlan({
    required EatingPlanRepository repository,
  }) : _repository = repository;

  final EatingPlanRepository _repository;

  Future<EatingPlan?> call({
    required String id,
  }) async {
    final EatingPlan? user = await _repository.getEatingPlan(id: id);
    return user;
  }
}
