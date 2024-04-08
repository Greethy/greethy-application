import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';

abstract class EatingPlanRepository {
  Future<EatingPlan?> getEatingPlan({
    required String id,
  });

  Future<EatingPlan?> postEatingPlan({
    required EatingPlan eatingPlan,
  });

  Future<EatingPlan?> putEatingPlan({
    required String id,
    required EatingPlan eatingPlan,
  });
}
