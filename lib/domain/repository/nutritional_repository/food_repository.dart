import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';

abstract class FoodRepository {
  Future<Food?> getFood({
    required String id,
  });

  Future<Food?> postFood({
    required String food,
  });

  Future<Food?> putFood({
    required String id,
    required Food food,
  });
}
