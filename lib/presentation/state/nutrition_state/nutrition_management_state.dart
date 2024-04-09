import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/post_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/put_nutrition_management.dart';

import '../appState.dart';

class NutritionManagementState extends AppState {
  NutritionManagementState({
    required GetNutritionManagement getNutritionManagement,
    required PostNutritionManagement postNutritionManagement,
    required PutNutritionManagement putNutritionManagement,
  })  : _getNutritionManagement = getNutritionManagement,
        _postNutritionManagement = postNutritionManagement,
        _putNutritionManagement = putNutritionManagement;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetNutritionManagement _getNutritionManagement;
  final PostNutritionManagement _postNutritionManagement;
  final PutNutritionManagement _putNutritionManagement;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late NutritionManagement? _nutritionManagement;

  NutritionManagement? get nutritionManagement => _nutritionManagement;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getNutritionManagementMySelf() async {
    // isBusy = true;
    print("start getNutritionManagementMySelf");
    _nutritionManagement = await _getNutritionManagement.call();
    print("getNutritionManagementMySelf done");
    isBusy = false;
  }

  /// post body specs
  Future<void> postNutritionManagementMySelf(NutritionManagement nutritionManagement) async {
    isBusy = true;
    _nutritionManagement = await _postNutritionManagement.call(nutritionManagement: nutritionManagement);
    isBusy = false;
  }

  /// put body specs
  Future<void> putNutritionManagementMySelf(String id, NutritionManagement nutritionManagement) async {
    isBusy = true;
    _nutritionManagement = await _putNutritionManagement.call(id: id, nutritionManagement: nutritionManagement);
    isBusy = false;
  }
}
