import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/get_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/post_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/put_food_menu.dart';

import '../appState.dart';

class FoodMenuState extends AppState {
  FoodMenuState({
    required GetFoodMenu getFoodMenu,
    required PostFoodMenu postFoodMenu,
    required PutFoodMenu putFoodMenu,
  })  : _getFoodMenu = getFoodMenu,
        _postFoodMenu = postFoodMenu,
        _putFoodMenu = putFoodMenu;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetFoodMenu _getFoodMenu;
  final PostFoodMenu _postFoodMenu;
  final PutFoodMenu _putFoodMenu;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late FoodMenu? _foodMenu;

  FoodMenu? get foodMenu => _foodMenu;

  late double? _burn;

  double? get burn => _burn;

  late double? _eaten;

  double? get eaten => _eaten;

  late double? _progressValueCarbs;

  double? get progressValueCarbs => _progressValueCarbs;

  late double? _progressValueFat;

  double? get progressValueFat => _progressValueFat;

  late double? _progressValueProtein;

  double? get progressValueProtein => _progressValueProtein;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getFoodMenu(String? id) async {
    isBusy = true;
    FoodMenu? menu;
    if (id != null) menu = await _getFoodMenu.call(id: id);
    if (menu != null) save(menu);
    isBusy = false;
  }

  /// post body specs
  Future<void> postFoodMenu(FoodMenu foodMenu) async {
    isBusy = true;
    _foodMenu = await _postFoodMenu.call(foodMenu: foodMenu);
    isBusy = false;
  }

  /// put body specs
  Future<void> putFoodMenu(String id, FoodMenu foodMenu) async {
    isBusy = true;
    _foodMenu = await _putFoodMenu.call(id: id, foodMenu: foodMenu);
    isBusy = false;
  }

  Future<void> save(FoodMenu menu) async {
    _foodMenu = menu;
    double eating = 0;
    double carbsEating = 0;
    double fatEating = 0;
    double proteinEating = 0;
    List<Meal>? meals = menu.meals;
    if (meals != null && meals != []) {
      for (Meal m in meals) {
        bool? eaten = m.status;
        if (eaten != null && eaten){
          eating += m.calories ?? 0;
          carbsEating += m.glucid ?? 0;
          fatEating += m.lipid ?? 0;
          proteinEating += m.protein ?? 0;
        }
      }
    }
    _eaten = eating;
    _progressValueCarbs = carbsEating;
    _progressValueFat = fatEating;
    _progressValueProtein = proteinEating;

  }
}
