import 'package:equatable/equatable.dart';

class FoodMenu extends Equatable {
  final String? id;
  final String? eatingPlanId;
  final String? createdDate;
  final List<String>? menuType;
  final String? relatedGroupId;
  final MenuCalories? menuCalories;
  final List<Meal>? meals;

  FoodMenu({
    this.id,
    this.eatingPlanId,
    this.createdDate,
    this.menuType,
    this.relatedGroupId,
    this.menuCalories,
    this.meals,
  });

  @override
  List<Object?> get props => [
        id,
        eatingPlanId,
        createdDate,
        menuType,
        relatedGroupId,
        menuCalories,
        meals,
      ];

  get foodPic => null;
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
  final String? foodPic;

  FoodIndex({
    this.name,
    this.foodId,
    this.foodPic,
  });

  @override
  List<Object?> get props => [name, foodId, foodPic];
}
