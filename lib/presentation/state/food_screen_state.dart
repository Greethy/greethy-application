
import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';

class FoodScreenState extends AppState {
  FoodScreenState({
    required String foodId,
  }) : _foodId = foodId {
    // initDatabase();
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  final String _foodId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetFood _getFood = DependencyInjection().getFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  // init database status
  bool initData = false;

  // food @{
  late Food? _food;

  Food? get food => _food;

  late List<Nutrient> _nutrients;

  List<Nutrient> get nutrients => _nutrients;

  // Nutritional composition table
  List<List<Widget>> _nutrientsCells = [];

  List<List<Widget>> get nutrientsCells => _nutrientsCells;

  late List<Ingredient> _ingredients;

  List<Ingredient> get ingredients => _ingredients;

  // ingredient list table
  List<List<Widget>> _ingredientsCells = [];

  List<List<Widget>> get ingredientsCells => _ingredientsCells;

  // }@

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// init data
  Future<bool> initDatabase() async {
    print("chunhthandhe " + initData.toString());
    if (initData == true) {
      return true;
    }

    // get food detail
    _food = await _getFood.call(id: _foodId);

    print("chunhthandhe lalala" + _food.toString());

    _nutrients = _food!.nutrients!;
    print("_nutrients lalala" + _nutrients.toString());
    await initNutrientsCells();
    await initIngredients();

    initData = true;
    isBusy = false;
    return true;
  }

  Future<void> initNutrientsCells() async {
    List<Widget> headerRow = [
      Text('CHỈ TIÊU', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('GIÁ TRỊ', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('ĐƠN VỊ', style: TextStyle(fontWeight: FontWeight.bold)),
    ];
    _nutrientsCells.add(headerRow);
    for (Nutrient nutrient in _nutrients) {
      List<Widget> row = [
        Text(nutrient.nutritionName ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(nutrient.value.toString() ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(nutrient.unit ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
      ];
      _nutrientsCells.add(row);
    }
  }

  Future<void> initIngredients() async {
    List<Widget> headerRow = [
      Text('TÊN NGUYÊN LIỆU', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('ĐỊNH LƯỢNG ĐÃ SƠ CHẾ', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('DINH DƯỠNG', style: TextStyle(fontWeight: FontWeight.bold)),
      Text('CÁCH CHUẨN BỊ', style: TextStyle(fontWeight: FontWeight.bold)),
    ];
    _nutrientsCells.add(headerRow);
    for (Ingredient ingredient in _ingredients) {
      List<Widget> row = [
        Text(ingredient.ingredientName ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(ingredient.value.toString() + ingredient.unit.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
        Text(ingredient.kcal.toString() ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(ingredient.prepare ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
      ];
      _nutrientsCells.add(row);
    }
  }
}
