import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';

abstract class IngredientRepository {
  Future<Ingredient?> getIngredient({
    required String id,
  });

  Future<Ingredient?> postIngredient({
    required String ingredient,
  });

  Future<Ingredient?> putIngredient({
    required String id,
    required Ingredient ingredient,
  });
}
