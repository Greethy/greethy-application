import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_menu_reposotory.dart';

class GetFoodMenu {
  GetFoodMenu({
    required FoodMenuRepository repository,
  }) : _repository = repository;

  final FoodMenuRepository _repository;

  Future<FoodMenu?> call({
    required String id,
  }) async {
    final FoodMenu? user = await _repository.getFoodMenu(id: id);
    return user;
  }
}
