import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/put_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/put_nutrition_management.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';

class CustomizeMenuOptionScreenState extends AppState {
  CustomizeMenuOptionScreenState({
    required String eatingPlanId,
  }) : _eatingPlanId = eatingPlanId {
    // initDatabase();
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  final String _eatingPlanId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetEatingPlan _getEatingPlan = DependencyInjection().getEatingPlan;
  final CasePutEatingPlan _putEatingPlan = DependencyInjection().putEatingPlan;
  final CasePutNutritionManagement _putNutritionManagement = DependencyInjection().putNutritionManagement;
  final CaseGetNutritionManagement _getNutritionManagement = DependencyInjection().getNutritionManagement;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  // init database status
  bool initData = false;

  // eatingPlan @{
  late EatingPlan? _eatingPlan;

  EatingPlan? get eatingPlan => _eatingPlan;

  late EatingPlan? _eatingPlanCustom;

  EatingPlan? get eatingPlanCustom => _eatingPlanCustom;

  // }@

  // eatingPlan @{
  late NutritionManagement? _nutritionManagement;

  NutritionManagement? get nutritionManagement => _nutritionManagement;

  late NutritionManagement? _nutritionManagementCustom;

  NutritionManagement? get nutritionManagementCustom => _nutritionManagementCustom;
  // }@

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// init data
  Future<bool> initDatabase() async {
    if (initData == true) {
      return true;
    }

    // get eatingPlan detail
    _eatingPlan = await _getEatingPlan.call(id: _eatingPlanId);
    _nutritionManagement = await _getNutritionManagement.call();

    initData = true;

    actionUpdate();
    return true;
  }


  Future<bool> update() async {
    if (initData == true) {
      return true;
    }

    // get eatingPlan detail
    _eatingPlan = await _getEatingPlan.call(id: _eatingPlanId);
    _nutritionManagement = await _getNutritionManagement.call();

    initData = true;

    actionUpdate();
    return true;
  }

}
