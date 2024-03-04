import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String id;
  final String? foodName;
  final List<String>? foodType;
  final String? foodImageUrl;
  final String? foodVideoCooking;
  final int? totalCalories;
  final String? recipe;
  final String? tips;
  final List<Ingredient>? ingredients;
  final List<Nutrient>? nutrients;

  Food({
     required this.id,
     this.foodName,
     this.foodType,
     this.foodImageUrl,
     this.foodVideoCooking,
     this.totalCalories,
     this.recipe,
     this.tips,
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
    ingredients,
    nutrients,
  ];
}

class Ingredient extends Equatable {
  final String ingredientId;
  final String? ingredientName;
  final List<Ingredient>? ingredientReplace;
  final double? value;
  final String? unit;
  final String? prepare;
  final int? kcal;

  Ingredient({
     required this.ingredientId,
     this.ingredientName,
     this.ingredientReplace,
     this.value,
     this.unit,
     this.prepare,
     this.kcal,
  });

  @override
  List<Object?> get props => [
    ingredientId,
    ingredientName,
    ingredientReplace,
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
  List<Object?> get props => [nutritionName, value, unit];
}