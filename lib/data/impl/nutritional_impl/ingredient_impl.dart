import 'package:greethy_application/data/dto/nutrition_dto/Ingredient_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/ingredient_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientApi _api;

  IngredientRepositoryImpl({
    required IngredientApi api,
  }) : _api = api;

  @override
  Future<Ingredient?> getIngredient({required String id}) async {
    final IngredientDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toIngredient();
  }

  @override
  Future<Ingredient?> postIngredient({required Ingredient ingredient}) async {
    final IngredientDto? fetched = await _api.post(ingredient);
    return fetched == null ? null : fetched.toIngredient();
  }

  @override
  Future<Ingredient?> putIngredient({required String id, required Ingredient ingredient}) async {
    final IngredientDto? fetched = await _api.put(id, ingredient);
    return fetched == null ? null : fetched.toIngredient();
  }
}
