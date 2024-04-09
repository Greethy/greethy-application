import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/ingredient_repository.dart';

class GetIngredient {
  GetIngredient({
    required IngredientRepository repository,
  }) : _repository = repository;

  final IngredientRepository _repository;

  Future<Ingredient?> call({
    required String id,
  }) async {
    final Ingredient? user = await _repository.getIngredient(id: id);
    return user;
  }
}
