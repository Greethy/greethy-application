import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';

class FoodMenuDto extends FoodMenu {
  FoodMenuDto({
    super.id,
    super.createdDate,
    super.menuType,
    super.menuCalories,
    super.meals,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory FoodMenuDto.fromRawJson(String str) => FoodMenuDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory FoodMenuDto.fromMap(Map<String, dynamic> json) => FoodMenuDto(
        id: json['id'],
        createdDate: json['created_date'],
        menuType: json['menu_type'] == null ? [] : List<String>.from(json['menu_type']),
        menuCalories: json['menu_calories'] == null ? null : MenuCaloriesDto.fromMap(json['menu_calories']),
        meals: json['meals'] == null ? null : List<MealDto>.from(json['meals'].map((x) => MealDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_date': createdDate,
      'menu_type': menuType == null ? [] : menuType,
      'menu_calories': menuCalories == null ? null : MenuCaloriesDto.fromMenuCalories(menuCalories!).toMap(),
      'meals': meals == null ? null : MealDto.fromMealList(meals!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static FoodMenuDto fromFoodMenu(FoodMenu foodMenu) {
    return FoodMenuDto(
      id: foodMenu.id,
      createdDate: foodMenu.createdDate,
      menuType: foodMenu.menuType,
      menuCalories: foodMenu.menuCalories,
      meals: foodMenu.meals,
    );
  }

  FoodMenu toFoodMenu() {
    return FoodMenu(
      id: id,
      createdDate: createdDate,
      menuType: menuType,
      menuCalories: menuCalories,
      meals: meals,
    );
  }
}

class MenuCaloriesDto extends MenuCalories {
  MenuCaloriesDto({
    super.protein,
    super.lipid,
    super.glucid,
    super.calories,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory MenuCaloriesDto.fromRawJson(String str) => MenuCaloriesDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory MenuCaloriesDto.fromMap(Map<String, dynamic> json) => MenuCaloriesDto(
        protein: json['protein'],
        lipid: json['lipid'],
        glucid: json['glucid'],
        calories: json['calories'],
      );

  Map<String, dynamic> toMap() {
    return {
      'protein': protein,
      'lipid': lipid,
      'glucid': glucid,
      'calories': calories,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  MenuCalories toMenuCalories() {
    return MenuCalories(
      protein: protein,
      lipid: lipid,
      glucid: glucid,
      calories: calories,
    );
  }

  static MenuCaloriesDto fromMenuCalories(MenuCalories menuCalories) {
    return MenuCaloriesDto(
      protein: menuCalories.protein,
      lipid: menuCalories.lipid,
      glucid: menuCalories.glucid,
      calories: menuCalories.calories,
    );
  }
}

class MealDto extends Meal {
  MealDto({
    super.meal,
    super.protein,
    super.lipid,
    super.glucid,
    super.calories,
    super.foodsReplace,
    super.status,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory MealDto.fromRawJson(String str) => MealDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory MealDto.fromMap(Map<String, dynamic> json) => MealDto(
        meal: json['meal'],
        protein: json['protein'],
        lipid: json['lipid'],
        glucid: json['glucid'],
        calories: json['calories'],
        foodsReplace: json['foods'] == null ? [] : List<String>.from(json['foods']),
        status: json['status'],
      );

  Map<String, dynamic> toMap() {
    return {
      'meal': meal,
      'protein': protein,
      'lipid': lipid,
      'glucid': glucid,
      'calories': calories,
      'foods': foodsReplace == null ? [] : foodsReplace,
      'status': status,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static MealDto fromMeal(Meal meal) {
    return MealDto(
      meal: meal.meal,
      protein: meal.protein,
      lipid: meal.lipid,
      glucid: meal.glucid,
      calories: meal.calories,
      foodsReplace: meal.foodsReplace,
      status: meal.status,
    );
  }

  Meal toMeal() {
    return Meal(
      meal: meal,
      protein: protein,
      lipid: lipid,
      glucid: glucid,
      calories: calories,
      foodsReplace: foodsReplace,
      status: status,
    );
  }

  static List<MealDto> fromMealList(List<Meal> mealList) {
    return mealList
        .map(
          (entity) => MealDto(
            meal: entity.meal,
            protein: entity.protein,
            lipid: entity.lipid,
            glucid: entity.glucid,
            calories: entity.calories,
            foodsReplace: entity.foodsReplace,
            status: entity.status,
          ),
        )
        .toList();
  }
}
