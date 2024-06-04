import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/ingredient_repository.dart';

class PostIngredient {
  PostIngredient({
    required IngredientRepository repository,
  }) : _repository = repository;

  final IngredientRepository _repository;

  Future<Ingredient?> call({
    required Ingredient ingredient,
  }) async {
    final Ingredient? result = await _repository.postIngredient(ingredient: ingredient);
    return result;
  }
}
