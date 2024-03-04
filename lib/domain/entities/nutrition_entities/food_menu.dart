import 'package:equatable/equatable.dart';

class FoodMenu extends Equatable {
  final String id;
  final String createdDate;
  final List<String>? menuType;
  final int? menuCalories;
  final Meals meals;

  FoodMenu({
    required this.id,
    required this.createdDate,
    this.menuType,
    this.menuCalories,
    required this.meals,
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

class Meals extends Equatable {
  final Meal? breakfast;
  final Meal? morningSnack;
  final Meal? lunch;
  final Meal? afternoonSnack;
  final Meal? dinner;

  Meals({
    this.breakfast,
    this.morningSnack,
    this.lunch,
    this.afternoonSnack,
    this.dinner,
  });

  @override
  List<Object?> get props => [
        breakfast,
        morningSnack,
        lunch,
        afternoonSnack,
        dinner,
      ];
}

class Meal extends Equatable {
  final String? protein;
  final String? lipid;
  final String? glucid;
  final int? calories;
  final List<int>? foods;

  Meal({
    this.protein,
    this.lipid,
    this.glucid,
    this.calories,
    this.foods,
  });

  @override
  List<Object?> get props => [
        protein,
        lipid,
        glucid,
        calories,
        foods,
      ];
}
