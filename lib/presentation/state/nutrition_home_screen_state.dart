import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/get_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/get_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/get_drink_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/get_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/get_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/post_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/put_nutrition_management.dart';
import 'package:greethy_application/presentation/state/appState.dart';

class NutritionHomeScreenState extends AppState {
  NutritionHomeScreenState({
    required GetNutritionManagement getNutritionManagement,
    required PostNutritionManagement postNutritionManagement,
    required PutNutritionManagement putNutritionManagement,
    required GetBodySpecs getBodySpecs,
    required GetDrinkPlan getDrinkPlan,
    required GetEatingPlan getEatingPlan,
    required GetEatingScheduleGroup getEatingScheduleGroup,
    required GetDrinkScheduleGroup getDrinkScheduleGroup,
    required GetFoodMenu getFoodMenu,
    required GetFood getFood,
  })  : _getNutritionManagement = getNutritionManagement,
        _postNutritionManagement = postNutritionManagement,
        _putNutritionManagement = putNutritionManagement,
        _getBodySpecs = getBodySpecs,
        _getDrinkPlan = getDrinkPlan,
        _getEatingPlan = getEatingPlan,
        _getEatingScheduleGroup = getEatingScheduleGroup,
        _getDrinkScheduleGroup = getDrinkScheduleGroup,
        _getFoodMenu = getFoodMenu,
        _getFood = getFood;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetNutritionManagement _getNutritionManagement;
  final PostNutritionManagement _postNutritionManagement;
  final PutNutritionManagement _putNutritionManagement;
  final GetBodySpecs _getBodySpecs;
  final GetDrinkPlan _getDrinkPlan;
  final GetEatingPlan _getEatingPlan;
  final GetEatingScheduleGroup _getEatingScheduleGroup;
  final GetDrinkScheduleGroup _getDrinkScheduleGroup;
  final GetFoodMenu _getFoodMenu;
  final GetFood _getFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late NutritionManagement? _nutritionManagement;

  NutritionManagement? get nutritionManagement => _nutritionManagement;

  late String _bodySpecsId;

  late BodySpecs? _bodySpecs;

  BodySpecs? get bodySpecs => _bodySpecs;

  late String _drinkPlanId;

  late DrinkPlan? _drinkPlan;

  DrinkPlan? get drinkPlan => _drinkPlan;

  late String _eatingPlanId;

  late EatingPlan? _eatingPlan;

  EatingPlan? get eatingPlan => _eatingPlan;

  late String _eatingScheduleGroupId;

  late EatingScheduleGroup? _eatingScheduleGroup;

  EatingScheduleGroup? get eatingScheduleGroup => _eatingScheduleGroup;

  late String _drinkScheduleGroupId;

  late DrinkScheduleGroup? _drinkScheduleGroup;

  DrinkScheduleGroup? get drinkScheduleGroup => _drinkScheduleGroup;

  late String _foodMenuId;

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

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// init data
  Future<bool> initDatabase() async {
    print("start initDatabase");
    // get database
    _nutritionManagement = await _getNutritionManagement.call();

    _bodySpecsId = _nutritionManagement!.bodySpecs![0];
    _bodySpecs = await _getBodySpecs.call(id: _bodySpecsId);

    _eatingPlanId = _nutritionManagement!.eatingPlanPersonalId!;
    _eatingPlan = await _getEatingPlan.call(id: _eatingPlanId);

    print("start get _drinkPlanId");
    _drinkPlanId = _nutritionManagement!.drinkPlanId!;
    _drinkPlan = await _getDrinkPlan.call(id: _drinkPlanId);

    print("start get _foodMenuId");
    _foodMenuId = _eatingPlan!.eatingScheduleWeek![0].menuId!;
    _foodMenu = await _getFoodMenu.call(id: _foodMenuId);
    print("end get _foodMenuId");

    // calculate
    await calculateBodyParameters();
    print("end calculateBodyParameters");

    isBusy = false;
    return true;
  }

  Future<void> calculateBodyParameters() async {
    int eating = 0;
    double carbsEating = 0;
    double fatEating = 0;
    double proteinEating = 0;
    List<Meal>? meals = _foodMenu!.meals;
    if (meals != null && meals != []) {
      for (Meal m in meals) {
        bool? eaten = m.status;
        if (eaten != null && eaten) {
          eating += m.calories?.toInt() ?? 0;
          carbsEating += m.glucid ?? 0;
          fatEating += m.lipid ?? 0;
          proteinEating += m.protein ?? 0;
        }
      }
    }
    _eaten = eating;
    _protein = _foodMenu!.menuCalories!.protein! - proteinEating;
    _fat = _foodMenu!.menuCalories!.lipid! - fatEating;
    _carbs = _foodMenu!.menuCalories!.glucid! - carbsEating;
    _progressValueCarbs = _carbs / _foodMenu!.menuCalories!.glucid!;
    _progressValueFat = _fat / _foodMenu!.menuCalories!.lipid!;
    _progressValueProtein = _protein / _foodMenu!.menuCalories!.protein!;

    _protein = (_protein * 10).roundToDouble() / 10;
    _fat = (_fat * 10).roundToDouble() / 10;
    _carbs = (_carbs * 10).roundToDouble() / 10;
    _progressValueCarbs = (_progressValueCarbs * 10).roundToDouble() / 10;
    _progressValueFat = (_progressValueFat * 10).roundToDouble() / 10;
    _progressValueProtein = (_progressValueProtein * 10).roundToDouble() / 10;
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
