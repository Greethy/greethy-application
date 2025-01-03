import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/get_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/post_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/put_drink_plan.dart';

import '../appState.dart';

class DrinkPlanState extends AppState {
  DrinkPlanState({
    required CaseGetDrinkPlan getDrinkPlan,
    required CasePostDrinkPlan postDrinkPlan,
    required CasePutDrinkPlan putDrinkPlan,
  })  : _getDrinkPlan = getDrinkPlan,
        _postDrinkPlan = postDrinkPlan,
        _putDrinkPlan = putDrinkPlan;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetDrinkPlan _getDrinkPlan;
  final CasePostDrinkPlan _postDrinkPlan;
  final CasePutDrinkPlan _putDrinkPlan;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late DrinkPlan? _drinkPlan;

  DrinkPlan? get drinkPlan => _drinkPlan;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getDrinkPlan(String id) async {
    isBusy = true;
    _drinkPlan = await _getDrinkPlan.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postDrinkPlan(DrinkPlan drinkPlan) async {
    isBusy = true;
    _drinkPlan = await _postDrinkPlan.call(drinkPlan: drinkPlan);
    isBusy = false;
  }

  /// put body specs
  Future<void> putDrinkPlan(String id, DrinkPlan drinkPlan) async {
    isBusy = true;
    _drinkPlan = await _putDrinkPlan.call(id: id, drinkPlan: drinkPlan);
    isBusy = false;
  }
}
