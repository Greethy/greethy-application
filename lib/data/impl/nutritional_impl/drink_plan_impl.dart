import 'package:greethy_application/data/dto/nutrition_dto/drink_plan_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/drink_plan_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/drink_plan_repository.dart';

class DrinkPlanRepositoryImpl implements DrinkPlanRepository {
  final DrinkPlanApi _api;

  DrinkPlanRepositoryImpl({
    required DrinkPlanApi api,
  }) : _api = api;

  @override
  Future<DrinkPlan?> getDrinkPlan({required String id}) async {
    final DrinkPlanDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toDrinkPlan();
  }

  @override
  Future<DrinkPlan?> postDrinkPlan({required DrinkPlan drinkPlan}) async {
    final DrinkPlanDto? fetched = await _api.post(drinkPlan);
    return fetched == null ? null : fetched.toDrinkPlan();
  }

  @override
  Future<DrinkPlan?> putDrinkPlan({required String id, required DrinkPlan drinkPlan}) async {
    final DrinkPlanDto? fetched = await _api.put(id, drinkPlan);
    return fetched == null ? null : fetched.toDrinkPlan();
  }

  @override
  Future<DrinkPlan?> postIncreaseWater() async {
    final DrinkPlanDto? fetched = await _api.postIncreaseWater();
    return fetched == null ? null : fetched.toDrinkPlan();
  }

  @override
  Future<DrinkPlan?> postReduceWater() async {
    final DrinkPlanDto? fetched = await _api.postReduceWater();
    return fetched == null ? null : fetched.toDrinkPlan();
  }
}
