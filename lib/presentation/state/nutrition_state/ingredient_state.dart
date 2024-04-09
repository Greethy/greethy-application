import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/get_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/post_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/put_ingredient.dart';

import '../appState.dart';

class IngredientState extends AppState {
  IngredientState({
    required GetIngredient getIngredient,
    required PostIngredient postIngredient,
    required PutIngredient putIngredient,
  })  : _getIngredient = getIngredient,
        _postIngredient = postIngredient,
        _putIngredient = putIngredient;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetIngredient _getIngredient;
  final PostIngredient _postIngredient;
  final PutIngredient _putIngredient;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late Ingredient? _ingredient;

  Ingredient? get collectiveModel => _ingredient;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getIngredientMySelf(String id) async {
    isBusy = true;
    _ingredient = await _getIngredient.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postIngredientMySelf(Ingredient ingredient) async {
    isBusy = true;
    _ingredient = await _postIngredient.call(ingredient: ingredient);
    isBusy = false;
  }

  /// put body specs
  Future<void> putIngredientMySelf(String id, Ingredient ingredient) async {
    isBusy = true;
    _ingredient = await _putIngredient.call(id: id, ingredient: ingredient);
    isBusy = false;
  }
}
