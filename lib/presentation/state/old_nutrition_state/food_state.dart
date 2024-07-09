import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/post_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/put_food.dart';

import '../appState.dart';

class FoodState extends AppState {
  FoodState({
    required CaseGetFood getFood,
    required CasePostFood postFood,
    required CasePutFood putFood,
  })  : _getFood = getFood,
        _postFood = postFood,
        _putFood = putFood;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetFood _getFood;
  final CasePostFood _postFood;
  final CasePutFood _putFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late Food? _food;

  Food? get food => _food;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getFood(String id) async {
    isBusy = true;
    _food = await _getFood.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postFood(Food food) async {
    isBusy = true;
    _food = await _postFood.call(food: food);
    isBusy = false;
  }

  /// put body specs
  Future<void> putFood(String id, Food food) async {
    isBusy = true;
    _food = await _putFood.call(id: id, food: food);
    isBusy = false;
  }
}
