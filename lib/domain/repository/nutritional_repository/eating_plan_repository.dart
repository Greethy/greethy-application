import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';

abstract class EatingPlanRepository {
  Future<EatingPlan?> getEatingPlan({
    required String gmail,
    required String password,
    required String type,
  });

  Future<EatingPlan?> postEatingPlan({
    required String gmail,
    required String password,
    required String type,
  });

  Future<EatingPlan?> putEatingPlan({
    required String gmail,
    required String password,
    required String type,
  });
}
