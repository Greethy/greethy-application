class MenuModel {
  final int id;
  final String createdDate;
  final List<String> menuType;
  final int menuCalories;
  final Meals meals;

  MenuModel({
    required this.id,
    required this.createdDate,
    required this.menuType,
    required this.menuCalories,
    required this.meals,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      createdDate: json['created_date'],
      menuType: List<String>.from(json['menu_type']),
      menuCalories: json['menu_calories'],
      meals: Meals.fromJson(json['meals']),
    );
  }
}

class Meals {
  final Meal breakfast;
  final Meal morningSnack;
  final Meal lunch;
  final Meal afternoonSnack;
  final Meal dinner;

  Meals({
    required this.breakfast,
    required this.morningSnack,
    required this.lunch,
    required this.afternoonSnack,
    required this.dinner,
  });

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      breakfast: Meal.fromJson(json['breakfast']),
      morningSnack: Meal.fromJson(json['morning_snack']),
      lunch: Meal.fromJson(json['lunch']),
      afternoonSnack: Meal.fromJson(json['afternoon_snack']),
      dinner: Meal.fromJson(json['dinner']),
    );
  }
}

class Meal {
  final String protein;
  final String lipid;
  final String glucid;
  final int calories;
  final List<int> foods;

  Meal({
    required this.protein,
    required this.lipid,
    required this.glucid,
    required this.calories,
    required this.foods,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final foodsList = (json['foods'] as List<dynamic>).cast<int>().toList();

    return Meal(
      protein: json['protein'],
      lipid: json['lipid'],
      glucid: json['glucid'],
      calories: json['calories'],
      foods: foodsList,
    );
  }
}