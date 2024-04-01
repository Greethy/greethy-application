import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String? id;
  final String? name;
  final List<Nutrition>? listNutritionPer100g;

  Ingredient({
     this.id,
     this.name,
     this.listNutritionPer100g,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        listNutritionPer100g,
      ];
}

class Nutrition extends Equatable {
  final String? name;
  final double? value;
  final String? unit;

  Nutrition({
     this.name,
     this.value,
     this.unit,
  });

  @override
  List<Object?> get props => [
        name,
        value,
        unit,
      ];
}