import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_repository.dart';

class PostFood {
  PostFood({
    required FoodRepository repository,
  }) : _repository = repository;

  final FoodRepository _repository;

  Future<Food?> call({
    required Food food,
  }) async {
    final Food? result = await _repository.postFood(food: food);
    return result;
  }
}
