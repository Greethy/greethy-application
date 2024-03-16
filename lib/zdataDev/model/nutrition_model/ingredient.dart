class IngredientModel {
  final int id;
  final String name;
  final List<Nutrition> nutritionPer100g;

  IngredientModel({
    required this.id,
    required this.name,
    required this.nutritionPer100g,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    final nutritionList = (json['nutrition_per_100g'] as List<dynamic>)
        .map((nutritionJson) => Nutrition.fromJson(nutritionJson))
        .toList();

    return IngredientModel(
      id: json['id'],
      name: json['name'],
      nutritionPer100g: nutritionList,
    );
  }
}

class Nutrition {
  final String name;
  final double value;
  final String unit;

  Nutrition({
    required this.name,
    required this.value,
    required this.unit,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      name: json['name'],
      value: json['value'].toDouble(),
      unit: json['unit'],
    );
  }
}