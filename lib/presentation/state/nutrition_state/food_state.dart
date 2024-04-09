import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/post_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/put_food.dart';

import '../appState.dart';

class FoodState extends AppState {
  FoodState({
    required GetFood getFood,
    required PostFood postFood,
    required PutFood putFood,
  })  : _getFood = getFood,
        _postFood = postFood,
        _putFood = putFood;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetFood _getFood;
  final PostFood _postFood;
  final PutFood _putFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late Food? _food;

  Food? get collectiveModel => _food;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getFoodMySelf(String id) async {
    isBusy = true;
    _food = await _getFood.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postFoodMySelf(Food food) async {
    isBusy = true;
    _food = await _postFood.call(food: food);
    isBusy = false;
  }

  /// put body specs
  Future<void> putFoodMySelf(String id, Food food) async {
    isBusy = true;
    _food = await _putFood.call(id: id, food: food);
    isBusy = false;
  }
}
