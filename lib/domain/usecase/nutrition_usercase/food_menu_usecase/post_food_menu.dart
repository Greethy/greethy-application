import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_menu_reposotory.dart';

class CaseCasePostFoodMenu {
  CaseCasePostFoodMenu({
    required FoodMenuRepository repository,
  }) : _repository = repository;

  final FoodMenuRepository _repository;

  Future<FoodMenu?> call({
    required FoodMenu foodMenu,
  }) async {
    final FoodMenu? result = await _repository.postFoodMenu(foodMenu: foodMenu);
    return result;
  }
}
