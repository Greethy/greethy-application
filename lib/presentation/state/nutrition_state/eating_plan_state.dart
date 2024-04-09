import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/post_eating%20plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/put_eating_plan.dart';

import '../appState.dart';

class EatingPlanState extends AppState {
  EatingPlanState({
    required GetEatingPlan getEatingPlan,
    required PostEatingPlan postEatingPlan,
    required PutEatingPlan putEatingPlan,
  })  : _getEatingPlan = getEatingPlan,
        _postEatingPlan = postEatingPlan,
        _putEatingPlan = putEatingPlan;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetEatingPlan _getEatingPlan;
  final PostEatingPlan _postEatingPlan;
  final PutEatingPlan _putEatingPlan;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late EatingPlan? _eatingPlan;

  EatingPlan? get collectiveModel => _eatingPlan;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getEatingPlanMySelf(String id) async {
    isBusy = true;
    _eatingPlan = await _getEatingPlan.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postEatingPlanMySelf(EatingPlan eatingPlan) async {
    isBusy = true;
    _eatingPlan = await _postEatingPlan.call(eatingPlan: eatingPlan);
    isBusy = false;
  }

  /// put body specs
  Future<void> putEatingPlanMySelf(String id, EatingPlan eatingPlan) async {
    isBusy = true;
    _eatingPlan = await _putEatingPlan.call(id: id, eatingPlan: eatingPlan);
    isBusy = false;
  }
}
