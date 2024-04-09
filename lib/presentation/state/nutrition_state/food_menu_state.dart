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

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getFoodMenuMySelf(String id) async {
    isBusy = true;
    _foodMenu = await _getFoodMenu.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postFoodMenuMySelf(FoodMenu foodMenu) async {
    isBusy = true;
    _foodMenu = await _postFoodMenu.call(foodMenu: foodMenu);
    isBusy = false;
  }

  /// put body specs
  Future<void> putFoodMenuMySelf(String id, FoodMenu foodMenu) async {
    isBusy = true;
    _foodMenu = await _putFoodMenu.call(id: id, foodMenu: foodMenu);
    isBusy = false;
  }
}
