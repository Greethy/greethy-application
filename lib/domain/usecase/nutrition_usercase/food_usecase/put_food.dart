import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_repository.dart';

class CasePutFood {
  CasePutFood({
    required FoodRepository repository,
  }) : _repository = repository;

  final FoodRepository _repository;

  Future<Food?> call({
    required Food food,
    required String id,
  }) async {
    final Food? result = await _repository.putFood(food: food, id: id);
    return result;
  }
}
