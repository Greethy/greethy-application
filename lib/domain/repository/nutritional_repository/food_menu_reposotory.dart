import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';

abstract class FoodMenuRepository {
  Future<FoodMenu?> getFoodMenu({
    required String gmail,
    required String password,
    required String type,
  });

  Future<FoodMenu?> postFoodMenu({
    required String gmail,
    required String password,
    required String type,
  });

  Future<FoodMenu?> putFoodMenu({
    required String gmail,
    required String password,
    required String type,
  });
}
