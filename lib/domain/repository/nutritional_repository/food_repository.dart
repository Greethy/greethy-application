import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';

abstract class FoodRepository {
  Future<Food?> getFood({
    required String gmail,
    required String password,
    required String type,
  });

  Future<Food?> postFood({
    required String gmail,
    required String password,
    required String type,
  });

  Future<Food?> putFood({
    required String gmail,
    required String password,
    required String type,
  });
}
