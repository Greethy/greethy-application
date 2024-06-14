import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String? id;
  final String? foodName;
  final List<String>? foodType;
  final List<String>? foodImageUrl;
  final String? foodVideoCooking;
  final int? totalCalories;
  final String? recipe;
  final String? tips;
  final String? moreInformation;
  final List<Ingredient>? ingredients;
  final List<Nutrient>? nutrients;

  Food({
    this.id,
    this.foodName,
    this.foodType,
    this.foodImageUrl,
    this.foodVideoCooking,
    this.totalCalories,
    this.recipe,
    this.tips,
    this.moreInformation,
    this.ingredients,
    this.nutrients,
  });

  @override
  List<Object?> get props => [
        id,
        foodName,
        foodType,
        foodImageUrl,
        foodVideoCooking,
        totalCalories,
        recipe,
        tips,
        moreInformation,
        ingredients,
        nutrients,
      ];
}

class Ingredient extends Equatable {
  final String? ingredientId;
  final String? ingredientName;
  final double? value;
  final String? unit;
  final String? prepare;
  final double? kcal;

  Ingredient({
    this.ingredientId,
    this.ingredientName,
    this.value,
    this.unit,
    this.prepare,
    this.kcal,
  });

  @override
  List<Object?> get props => [
        ingredientId,
        ingredientName,
        value,
        unit,
        prepare,
        kcal,
      ];
}

class Nutrient extends Equatable {
  final String? nutritionName;
  final double? value;
  final String? unit;

  Nutrient({
    this.nutritionName,
    this.value,
    this.unit,
  });

  @override
  List<Object?> get props => [
        nutritionName,
        value,
        unit,
      ];
}
