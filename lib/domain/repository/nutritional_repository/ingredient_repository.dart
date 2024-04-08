import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';

abstract class IngredientRepository {
  Future<Ingredient?> getIngredient({
    required String gmail,
    required String password,
    required String type,
  });

  Future<Ingredient?> postIngredient({
    required String gmail,
    required String password,
    required String type,
  });

  Future<Ingredient?> putIngredient({
    required String gmail,
    required String password,
    required String type,
  });
}
