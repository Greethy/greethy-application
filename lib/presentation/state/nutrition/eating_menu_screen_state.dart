import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/eating_plan_dto.dart';
import 'package:greethy_application/data/dto/nutrition_dto/food_menu_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/get_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/get_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';

class EatingMenuScreenState extends AppState {
  EatingMenuScreenState({
    required String foodMenuId,
  }) : _foodMenuId = foodMenuId {
    // initDatabase();
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  final String _foodMenuId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetNutritionManagement _getNutritionManagement = DependencyInjection().getNutritionManagement;
  final CaseGetEatingPlan _getEatingPlan = DependencyInjection().getEatingPlan;
  final CaseGetEatingScheduleGroup _getEatingScheduleGroup = DependencyInjection().getEatingScheduleGroup;
  final CaseCaseGetFoodMenu _getFoodMenu = DependencyInjection().getFoodMenu;
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

  // eating plan @{

  late String _eatingPlanId;

  late EatingPlan? _eatingPlan;

  EatingPlan? get eatingPlan => _eatingPlan;

  int bmrPerDay = 0;

  // }@

  // food menu @{

  late FoodMenu? _foodMenu;

  FoodMenu? get foodMenu => _foodMenu;

  /// food list
  List<Meal> _meals = [];

  /// breakfast food list
  Meal? _breakfast;

  Meal? get breakfast => _breakfast;

  List<FoodIndex> _foodIndexBreakfast = [];

  List<FoodIndex> get foodIndexBreakfast => _foodIndexBreakfast;

  /// breakfast snack food list
  Meal? _morningSnack;

  Meal? get morningSnack => _morningSnack;

  List<FoodIndex> _foodIndexSnackMorning = [];

  List<FoodIndex> get foodIndexSnackMorning => _foodIndexSnackMorning;

  /// lunch food list
  Meal? _lunch;

  Meal? get lunch => _lunch;

  List<FoodIndex> _foodIndexLunch = [];

  List<FoodIndex> get foodIndexLunch => _foodIndexLunch;

  /// lunch snack food list
  Meal? _afternoonSnack;

  Meal? get afternoonSnack => _afternoonSnack;

  List<FoodIndex> _foodIndexSnackAfternoon = [];

  List<FoodIndex> get foodIndexSnackAfternoon => _foodIndexSnackAfternoon;

  /// dinner food list
  Meal? _dinner;

  Meal? get dinner => _dinner;

  List<FoodIndex> _foodIndexDinner = [];

  List<FoodIndex> get foodIndexDinner => _foodIndexDinner;

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
    _foodMenu = await _getFoodMenu.call(id: _foodMenuId);

    // get eating plan
    _eatingPlanId = _foodMenu!.eatingPlanId!;
    _eatingPlan = await _getEatingPlan.call(id: _eatingPlanId);
    bmrPerDay = _eatingPlan!.bmrPerDay!;

    // handle data food menu
    _meals = _foodMenu!.meals!;

    for (Meal meal in _meals) {
      if (meal.meal == "breakfast") {
        _breakfast = meal;
        _foodIndexBreakfast = meal.foods!;
      } else if (meal.meal == "morning snack") {
        _morningSnack = meal;
        _foodIndexSnackMorning = meal.foods!;
      } else if (meal.meal == "lunch") {
        _lunch = meal;
        _foodIndexLunch = meal.foods!;
      } else if (meal.meal == "afternoon snack") {
        _afternoonSnack = meal;
        _foodIndexSnackAfternoon = meal.foods!;
      } else if (meal.meal == "dinner") {
        _dinner = meal;
        _foodIndexDinner = meal.foods!;
      } else {
        print(meal.toString());
      }
    }

    initData = true;
    return true;
  }

  Future<bool> initDatabase2() async {
    FoodMenuDto foodMenuDto = FoodMenuDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/data/food_menu_sample/1.json'));

    // get food menu
    _foodMenu = foodMenuDto.toFoodMenu();

    print(_foodMenu.toString());

    // get eating plan
    _eatingPlanId = _foodMenu!.eatingPlanId!;

    EatingPlanDto eatingPlanDto = await EatingPlanDto.fromRawJson(await rootBundle.loadString('assets/database_sample/nutritional/eatting_schedule/eating_plan_final.json'));
    _eatingPlan = eatingPlanDto.toEatingPlan();

    bmrPerDay = _eatingPlan!.bmrPerDay!;

    // handle data food menu
    _meals = _foodMenu!.meals!;

    for (Meal meal in _meals) {
      if (meal.meal == "breakfast") {
        _breakfast = meal;
        _foodIndexBreakfast = meal.foods!;
      } else if (meal.meal == "morning snack") {
        _morningSnack = meal;
        _foodIndexSnackMorning = meal.foods!;
      } else if (meal.meal == "lunch") {
        _lunch = meal;
        _foodIndexLunch = meal.foods!;
      } else if (meal.meal == "afternoon snack") {
        _afternoonSnack = meal;
        _foodIndexSnackAfternoon = meal.foods!;
      } else if (meal.meal == "dinner") {
        _dinner = meal;
        _foodIndexDinner = meal.foods!;
      } else {
        print(meal.toString());
      }
    }

    notifyListeners();

    initData = true;
    return true;
  }

  updateStatus(String meal) {
    if (meal == "BỮA TỐI") {
      _dinner = _dinner?.copyWith(status: _dinner?.status == null ? false : !_dinner!.status!);
    } else if (meal == "BỮA SÁNG") {
      _breakfast = _breakfast?.copyWith(status: _breakfast?.status == null ? false : !_breakfast!.status!);
    } else if (meal == "BỮA TRƯA") {
      _lunch = _lunch?.copyWith(status: _lunch?.status == null ? false : !_lunch!.status!);
    } else if (meal == "BỮA PHỤ CHIỀU") {
      _afternoonSnack = _afternoonSnack?.copyWith(status: _afternoonSnack?.status == null ? false : !_afternoonSnack!.status!);
    } else if (meal == "BỮA PHỤ SÁNG") {
      _morningSnack = _morningSnack?.copyWith(status: _morningSnack?.status == null ? false : !_morningSnack!.status!);
    }
    notifyListeners();
  }
}
