import 'package:greethy_application/data/dto/nutrition_dto/eating_plan_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/eating_plan_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_plan_repository.dart';

class EatingPlanRepositoryImpl implements EatingPlanRepository {
  final EatingPlanApi _api;

  EatingPlanRepositoryImpl({
    required EatingPlanApi api,
  }) : _api = api;

  @override
  Future<EatingPlan?> getEatingPlan({required String id}) async {
    final EatingPlanDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toEatingPlan();
  }

  @override
  Future<EatingPlan?> postEatingPlan({required EatingPlan eatingPlan}) async {
    final EatingPlanDto? fetched = await _api.post(eatingPlan);
    return fetched == null ? null : fetched.toEatingPlan();
  }

  @override
  Future<EatingPlan?> putEatingPlan({required String id, required EatingPlan eatingPlan}) async {
    final EatingPlanDto? fetched = await _api.put(id, eatingPlan);
    return fetched == null ? null : fetched.toEatingPlan();
  }
}
