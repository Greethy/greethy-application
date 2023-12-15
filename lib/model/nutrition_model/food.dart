class FoodModel {
  final int id;
  final String foodName;
  final List<String> foodType;
  final String foodImageUrl;
  final String foodVideoCooking;
  final int totalCalories;
  final String recipe;
  final String tips;
  final List<Ingredient> ingredients;
  final List<Nutrient> nutrients;

  FoodModel({
    required this.id,
    required this.foodName,
    required this.foodType,
    required this.foodImageUrl,
    required this.foodVideoCooking,
    required this.totalCalories,
    required this.recipe,
    required this.tips,
    required this.ingredients,
    required this.nutrients,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    final ingredientsList = (json['ingredients'] as List<dynamic>)
        .map((ingredientJson) => Ingredient.fromJson(ingredientJson))
        .toList();

    final nutrientsList = (json['nutrients'] as List<dynamic>)
        .map((nutrientJson) => Nutrient.fromJson(nutrientJson))
        .toList();

    return FoodModel(
      id: json['id'],
      foodName: json['food_name'],
      foodType: List<String>.from(json['food_type']),
      foodImageUrl: json['food_image_url'],
      foodVideoCooking: json['food_video_cooking'],
      totalCalories: json['total_calories'],
      recipe: json['recipe'],
      tips: json['tips'],
      ingredients: ingredientsList,
      nutrients: nutrientsList,
    );
  }
}

class Ingredient {
  final int ingredientId;
  final String ingredientName;
  final List<int> ingredientReplace;
  final double value;
  final String unit;
  final String prepare;
  final int kcal;

  Ingredient({
    required this.ingredientId,
    required this.ingredientName,
    required this.ingredientReplace,
    required this.value,
    required this.unit,
    required this.prepare,
    required this.kcal,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    final ingredientReplaceList =
        (json['ingredient_replace'] as List<dynamic>).cast<int>().toList();

    return Ingredient(
      ingredientId: json['ingredient_id'],
      ingredientName: json['ingredient_name'],
      ingredientReplace: ingredientReplaceList,
      value: json['value'].toDouble(),
      unit: json['unit'],
      prepare: json['prepare'],
      kcal: json['kcal'],
    );
  }
}

class Nutrient {
  final String nutritionName;
  final double value;
  final String unit;

  Nutrient({
    required this.nutritionName,
    required this.value,
    required this.unit,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      nutritionName: json['nutrition_name'],
      value: json['value'].toDouble(),
      unit: json['unit'],
    );
  }
}