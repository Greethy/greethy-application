import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_menu_reposotory.dart';

class PutFoodMenu {
  PutFoodMenu({
    required FoodMenuRepository repository,
  }) : _repository = repository;

  final FoodMenuRepository _repository;

  Future<FoodMenu?> call({
    required FoodMenu foodMenu,
    required String id,
  }) async {
    final FoodMenu? user = await _repository.putFoodMenu(foodMenu: foodMenu, id: id);
    return user;
  }
}
