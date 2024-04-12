import 'package:equatable/equatable.dart';

class FoodMenu extends Equatable {
  final String? id;
  final String? createdDate;
  final List<String>? menuType;
  final MenuCalories? menuCalories;
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

class MenuCalories extends Equatable {
  final double? protein;
  final double? lipid;
  final double? glucid;
  final double? calories;

  MenuCalories({
    this.protein,
    this.lipid,
    this.glucid,
    this.calories,
  });

  @override
  List<Object?> get props => [
        protein,
        lipid,
        glucid,
        calories,
      ];
}

class Meal extends Equatable {
  final String? meal;
  final double? protein;
  final double? lipid;
  final double? glucid;
  final double? calories;
  final List<FoodIndex>? foods;
  final bool? status;

  Meal({
    this.meal,
    this.protein,
    this.lipid,
    this.glucid,
    this.calories,
    this.foods,
    this.status,
  });

  @override
  List<Object?> get props => [
        meal,
        protein,
        lipid,
        glucid,
        calories,
        foods,
        status,
      ];
}

class FoodIndex extends Equatable {
  final String? name;
  final String? foodId;

  FoodIndex({
    this.name,
    this.foodId,
  });

  @override
  List<Object?> get props => [
    name,
    foodId,
  ];
}
