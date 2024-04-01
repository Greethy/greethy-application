import 'package:equatable/equatable.dart';

class FoodMenu extends Equatable {
  final String? id;
  final String? createdDate;
  final List<String>? menuType;
  final int? menuCalories;
  final List<Meal>? meals;

  FoodMenu({
    this.id,
    this.createdDate,
    this.menuType,
    this.menuCalories,
    this.meals,
  });

  @override
  List<Object?> get props => [
        id,
        createdDate,
        menuType,
        menuCalories,
        meals,
      ];
}

class Meal extends Equatable {
  final String? meal;
  final String? protein;
  final String? lipid;
  final String? glucid;
  final String? calories;
  final List<String>? foodsReplace;

  Meal({
    this.meal,
    this.protein,
    this.lipid,
    this.glucid,
    this.calories,
    this.foodsReplace,
  });

  @override
  List<Object?> get props => [
        meal,
        protein,
        lipid,
        glucid,
        calories,
        foodsReplace,
      ];
}
