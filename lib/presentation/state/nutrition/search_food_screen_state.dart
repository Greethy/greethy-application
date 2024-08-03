import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';

class FoodSearchScreenState extends AppState {
  FoodSearchScreenState() {
    initDatabase();
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  // final String _foodMenuId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetNutritionManagement _getNutritionManagement = DependencyInjection().getNutritionManagement;
  final CaseGetFood _getFood = DependencyInjection().getFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  // init database status
  bool initData = false;

  // nutrition management @{

  late NutritionManagement? _nutritionManagement;

  NutritionManagement? get nutritionManagement => _nutritionManagement;

  // }@

  // food @{

  late Food? _food;

  Food? get food => _food;

  // }@

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// init data
  Future<bool> initDatabase() async {
    if (initData == true) {
      return true;
    }

    // get food menu
    _food = await _getFood.call(id: "1");

    initData = true;
    return true;
  }
}