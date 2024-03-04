import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String id;
  final String name;
  final List<Nutrition> nutritionPer100g;

  Ingredient({
    required this.id,
    required this.name,
    required this.nutritionPer100g,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        nutritionPer100g,
      ];
}

class Nutrition extends Equatable {
  final String name;
  final double value;
  final String unit;

  Nutrition({
    required this.name,
    required this.value,
    required this.unit,
  });

  @override
  List<Object?> get props => [
        name,
        value,
        unit,
      ];
}