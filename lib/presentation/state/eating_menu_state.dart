import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/get_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/get_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutrition_home_screen/widget/meals_card.dart';

class EatingMenuScreenState extends AppState {
  EatingMenuScreenState({
    required GetNutritionManagement getNutritionManagement,
    required GetEatingPlan getEatingPlan,
    required GetEatingScheduleGroup getEatingScheduleGroup,
    required GetFoodMenu getFoodMenu,
    required GetFood getFood,
  })  : _getNutritionManagement = getNutritionManagement,
        _getEatingPlan = getEatingPlan,
        _getEatingScheduleGroup = getEatingScheduleGroup,
        _getFoodMenu = getFoodMenu,
        _getFood = getFood;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetNutritionManagement _getNutritionManagement;
  final GetEatingPlan _getEatingPlan;
  final GetEatingScheduleGroup _getEatingScheduleGroup;
  final GetFoodMenu _getFoodMenu;
  final GetFood _getFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  bool initData = false;

  late NutritionManagement? _nutritionManagement;

  NutritionManagement? get nutritionManagement => _nutritionManagement;

  // eating plan @{

  late String _eatingPlanId;

  late EatingPlan? _eatingPlan;

  EatingPlan? get eatingPlan => _eatingPlan;

  int bmrPerDay = 0;

  // }@

  late String _eatingScheduleGroupId;

  late EatingScheduleGroup? _eatingScheduleGroup;

  EatingScheduleGroup? get eatingScheduleGroup => _eatingScheduleGroup;

  late String _drinkScheduleGroupId;

  late DrinkScheduleGroup? _drinkScheduleGroup;

  DrinkScheduleGroup? get drinkScheduleGroup => _drinkScheduleGroup;

  String _foodMenuId = "0";

  late FoodMenu? _foodMenu;

  FoodMenu? get foodMenu => _foodMenu;

  late String _foodId;

  late Food? _food;

  Food? get food => _food;

  int _burn = 0;

  int get burn => _burn;

  int _eaten = 0;

  int get eaten => _eaten;

  double _carbs = 0;

  double get carbs => _carbs;

  double _fat = 0;

  double get fat => _fat;

  double _protein = 0;

  double get protein => _protein;

  double _progressValueCarbs = 0;

  double get progressValueCarbs => _progressValueCarbs;

  double _progressValueFat = 0;

  double get progressValueFat => _progressValueFat;

  double _progressValueProtein = 0;

  double get progressValueProtein => _progressValueProtein;

  List<MealsModel> _meals = [];

  List<MealsModel> get meals => _meals;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// init data
  Future<bool> initDatabase() async {
    if (initData == true) {
      return true;
    }

    // get database
    _nutritionManagement = await _getNutritionManagement.call();

    _eatingPlanId = _nutritionManagement!.eatingPlanPersonalId!;
    _eatingPlan = await _getEatingPlan.call(id: _eatingPlanId);
    bmrPerDay = _eatingPlan!.bmrPerDay!;

    _foodMenuId = _eatingPlan!.eatingScheduleWeek![0].menuId!;
    _foodMenu = await _getFoodMenu.call(id: _foodMenuId);

    initData = true;
    return true;
  }
}
