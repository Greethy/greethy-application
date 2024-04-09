import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/get_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/post_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/put_drink_plan.dart';

import '../appState.dart';

class DrinkPlanState extends AppState {
  DrinkPlanState({
    required GetDrinkPlan getDrinkPlan,
    required PostDrinkPlan postDrinkPlan,
    required PutDrinkPlan putDrinkPlan,
  })  : _getDrinkPlan = getDrinkPlan,
        _postDrinkPlan = postDrinkPlan,
        _putDrinkPlan = putDrinkPlan;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetDrinkPlan _getDrinkPlan;
  final PostDrinkPlan _postDrinkPlan;
  final PutDrinkPlan _putDrinkPlan;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late DrinkPlan? _drinkPlan;

  DrinkPlan? get collectiveModel => _drinkPlan;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getDrinkPlanMySelf(String id) async {
    isBusy = true;
    _drinkPlan = await _getDrinkPlan.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postDrinkPlanMySelf(DrinkPlan drinkPlan) async {
    isBusy = true;
    _drinkPlan = await _postDrinkPlan.call(drinkPlan: drinkPlan);
    isBusy = false;
  }

  /// put body specs
  Future<void> putDrinkPlanMySelf(String id, DrinkPlan drinkPlan) async {
    isBusy = true;
    _drinkPlan = await _putDrinkPlan.call(id: id, drinkPlan: drinkPlan);
    isBusy = false;
  }
}
