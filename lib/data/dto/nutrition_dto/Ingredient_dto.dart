import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/Ingredient.dart';

class IngredientDto extends Ingredient {
  IngredientDto({
    super.id,
    super.name,
    super.listNutritionPer100g,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory IngredientDto.fromRawJson(String str) => IngredientDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory IngredientDto.fromMap(Map<String, dynamic> json) =>
      IngredientDto(
        id: json['id'],
        name: json['name'],
        listNutritionPer100g: json['nutrition_per_100g'] == null ? null : List<NutritionDto>.from(json['nutrition_per_100g'].map((x) => NutritionDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nutrition_per_100g': listNutritionPer100g == null ? null : NutritionDto.fromNutritionList(listNutritionPer100g!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static IngredientDto fromIngredient(Ingredient ingredient) {
    return IngredientDto(
      id: ingredient.id,
      name: ingredient.name,
      listNutritionPer100g: ingredient.listNutritionPer100g,
    );
  }

  Ingredient toIngredient() {
    return Ingredient(
      id: id,
      name: name,
      listNutritionPer100g: listNutritionPer100g,
    );
  }
}

class NutritionDto extends Nutrition {
  NutritionDto({
    super.name,
    super.value,
    super.unit,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory NutritionDto.fromRawJson(String str) => NutritionDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory NutritionDto.fromMap(Map<String, dynamic> json) =>
      NutritionDto(
        name: json['name'],
        value: json['value'].toDouble(),
        unit: json['unit'],
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'unit': unit,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static NutritionDto fromNutrition(Nutrition nutrition) {
    return NutritionDto(
      name: nutrition.name,
      value: nutrition.value,
      unit: nutrition.unit,
    );
  }

  static List<NutritionDto> fromNutritionList(List<Nutrition> nutritionList) {
    return nutritionList
        .map(
          (entity) =>
          NutritionDto(
            name: entity.name,
            value: entity.value,
            unit: entity.unit,
          ),
    )
        .toList();
  }

  Nutrition toNutrition() {
    return Nutrition(
      name: name,
      value: value,
      unit: unit,
    );
  }
}