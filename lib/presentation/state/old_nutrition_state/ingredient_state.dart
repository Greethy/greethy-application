import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/get_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/post_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/put_ingredient.dart';

import '../appState.dart';

class IngredientState extends AppState {
  IngredientState({
    required CaseGetIngredient getIngredient,
    required CasePostIngredient postIngredient,
    required CasePutIngredient putIngredient,
  })  : _getIngredient = getIngredient,
        _postIngredient = postIngredient,
        _putIngredient = putIngredient;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetIngredient _getIngredient;
  final CasePostIngredient _postIngredient;
  final CasePutIngredient _putIngredient;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late Ingredient? _ingredient;

  Ingredient? get ingredient => _ingredient;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getIngredient(String id) async {
    isBusy = true;
    _ingredient = await _getIngredient.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postIngredient(Ingredient ingredient) async {
    isBusy = true;
    _ingredient = await _postIngredient.call(ingredient: ingredient);
    isBusy = false;
  }

  /// put body specs
  Future<void> putIngredient(String id, Ingredient ingredient) async {
    isBusy = true;
    _ingredient = await _putIngredient.call(id: id, ingredient: ingredient);
    isBusy = false;
  }
}
