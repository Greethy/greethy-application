import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/ingredient_repository.dart';

class CasePutIngredient {
  CasePutIngredient({
    required IngredientRepository repository,
  }) : _repository = repository;

  final IngredientRepository _repository;

  Future<Ingredient?> call({
    required Ingredient ingredient,
    required String id,
  }) async {
    final Ingredient? result = await _repository.putIngredient(ingredient: ingredient, id: id);
    return result;
  }
}
