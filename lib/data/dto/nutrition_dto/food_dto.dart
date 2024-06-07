import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';

class FoodDto extends Food {
  FoodDto({
    super.id,
    super.foodName,
    super.foodType,
    super.foodImageUrl,
    super.foodVideoCooking,
    super.totalCalories,
    super.recipe,
    super.tips,
    super.ingredients,
    super.nutrients,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory FoodDto.fromRawJson(String str) => FoodDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory FoodDto.fromMap(Map<String, dynamic> json) => FoodDto(
    id: json['id'],
    foodName: json['food_name'],
    foodType: json['food_type'] == null ? [] : List<String>.from(json['food_type']),
    foodImageUrl: json['food_image_url'] == null ? [] : List<String>.from(json['food_image_url']),
    foodVideoCooking: json['food_video_cooking'],
    totalCalories: json['total_calories'],
    recipe: json['recipe'],
    tips: json['tips'],
    ingredients: json['ingredients'] == null ? null : List<IngredientDto>.from(json['ingredients'].map((x) => IngredientDto.fromMap(x))),
    nutrients: json['nutrients'] == null ? null : List<NutrientDto>.from(json['nutrients'].map((x) => NutrientDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'food_name': foodName,
      'food_type': foodType == null ? [] : foodType,
      'food_image_url': foodImageUrl == null ? [] : foodImageUrl,
      'food_video_cooking': foodVideoCooking,
      'total_calories': totalCalories,
      'recipe': recipe,
      'tips': tips,
      'ingredients': ingredients == null ? null : IngredientDto.fromIngredientList(ingredients!).map((x) => x.toMap()).toList(),
      'nutrients': nutrients == null ? null : NutrientDto.fromNutrientList(nutrients!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static FoodDto fromFood(Food food) {
    return FoodDto(
      id: food.id,
      foodName: food.foodName,
      foodType: food.foodType,
      foodImageUrl: food.foodImageUrl,
      foodVideoCooking: food.foodVideoCooking,
      totalCalories: food.totalCalories,
      recipe: food.recipe,
      tips: food.tips,
      ingredients: food.ingredients,
      nutrients: food.nutrients,
    );
  }

  Food toFood() {
    return Food(
      id: id,
      foodName: foodName,
      foodType: foodType,
      foodImageUrl: foodImageUrl,
      foodVideoCooking: foodVideoCooking,
      totalCalories: totalCalories,
      recipe: recipe,
      tips: tips,
      ingredients: ingredients,
      nutrients: nutrients,
    );
  }
}

class IngredientDto extends Ingredient {
  IngredientDto({
    super.ingredientId,
    super.ingredientName,
    super.ingredientReplaceId,
    super.value,
    super.unit,
    super.prepare,
    super.kcal,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory IngredientDto.fromRawJson(String str) => IngredientDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory IngredientDto.fromMap(Map<String, dynamic> json) => IngredientDto(
        ingredientId: json['ingredient_id'],
        ingredientName: json['ingredient_name'],
        ingredientReplaceId: json['ingredient_replace'] == null ? [] : List<String>.from(json['ingredient_replace']),
        value: json['value'].toDouble(),
        unit: json['unit'],
        prepare: json['prepare'],
        kcal: json['kcal'].toDouble(),
      );

  Map<String, dynamic> toMap() {
    return {
      'ingredient_id': ingredientId,
      'ingredient_name': ingredientName,
      'ingredient_replace': ingredientReplaceId == null ? [] : ingredientReplaceId,
      'value': value,
      'unit': unit,
      'prepare': prepare,
      'kcal': kcal,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static IngredientDto fromIngredient(Ingredient ingredient) {
    return IngredientDto(
      ingredientId: ingredient.ingredientId,
      ingredientName: ingredient.ingredientName,
      ingredientReplaceId: ingredient.ingredientReplaceId,
      value: ingredient.value,
      unit: ingredient.unit,
      prepare: ingredient.prepare,
      kcal: ingredient.kcal,
    );
  }

  Ingredient toIngredient() {
    return Ingredient(
      ingredientId: ingredientId,
      ingredientName: ingredientName,
      ingredientReplaceId: ingredientReplaceId,
      value: value,
      unit: unit,
      prepare: prepare,
      kcal: kcal,
    );
  }

  static List<IngredientDto> fromIngredientList(List<Ingredient> ingredientList) {
    return ingredientList
        .map(
          (entity) => IngredientDto(
            ingredientId: entity.ingredientId,
            ingredientName: entity.ingredientName,
            ingredientReplaceId: entity.ingredientReplaceId,
            value: entity.value,
            unit: entity.unit,
            prepare: entity.prepare,
            kcal: entity.kcal,
          ),
        )
        .toList();
  }
}

class NutrientDto extends Nutrient {
  NutrientDto({
    super.nutritionName,
    super.value,
    super.unit,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory NutrientDto.fromRawJson(String str) => NutrientDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory NutrientDto.fromMap(Map<String, dynamic> json) => NutrientDto(
        nutritionName: json['nutrition_name'],
        value: json['value'],
        unit: json['unit'],
      );

  Map<String, dynamic> toMap() {
    return {
      'nutrition_name': nutritionName,
      'value': value,
      'unit': unit,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static NutrientDto fromNutrient(Nutrient nutrient) {
    return NutrientDto(
      nutritionName: nutrient.nutritionName,
      value: nutrient.value,
      unit: nutrient.unit,
    );
  }

  Nutrient toNutrient() {
    return Nutrient(
      nutritionName: nutritionName,
      value: value,
      unit: unit,
    );
  }

  static List<NutrientDto> fromNutrientList(List<Nutrient> nutrientList) {
    return nutrientList
        .map(
          (entity) => NutrientDto(
            nutritionName: entity.nutritionName,
            value: entity.value,
            unit: entity.unit,
          ),
        )
        .toList();
  }
}
