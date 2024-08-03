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
    print("FoodScreenState " + foodId);
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  final String _foodId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetFood _getFood = DependencyInjection().getFood;

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
    if (initData == true) {
      return true;
    }

    // get food detail
    print ("initDatabase " + _foodId);
    _food = await _getFood.call(id: _foodId);
    _nutrients = _food!.nutrients!;
    _ingredients = _food!.ingredients!;

    await initNutrientsCells();
    await initIngredients();

    initData = true;
    return true;
  }

  Future<void> initNutrientsCells() async {
    List<Widget> headerRow = [
      Text('CHỈ TIÊU', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      Text('GIÁ TRỊ', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      Text('ĐƠN VỊ', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ];
    _nutrientsCells.add(headerRow);
    for (Nutrient nutrient in _nutrients) {
      List<Widget> row = [
        Text(nutrient.nutritionName ?? "", textAlign: TextAlign.center),
        Text(nutrient.value.toString() ?? "", textAlign: TextAlign.center),
        Text(nutrient.unit ?? "", textAlign: TextAlign.center),
      ];
      _nutrientsCells.add(row);
    }
  }

  Future<void> initIngredients() async {
    List<Widget> headerRow = [
      Text('TÊN NGUYÊN LIỆU', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      Text('ĐỊNH LƯỢNG ĐÃ SƠ CHẾ', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      Text('DINH DƯỠNG', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      Text('CÁCH CHUẨN BỊ', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ];
    _ingredientsCells.add(headerRow);
    for (Ingredient ingredient in _ingredients) {
      List<Widget> row = [
        Text(ingredient.ingredientName ?? "", textAlign: TextAlign.center),
        Text(ingredient.value.toString() + ingredient.unit.toString(), textAlign: TextAlign.center),
        Text(ingredient.kcal.toString() ?? "", textAlign: TextAlign.center),
        Text(ingredient.prepare ?? "", textAlign: TextAlign.center),
      ];
      _ingredientsCells.add(row);
    }
  }
}
