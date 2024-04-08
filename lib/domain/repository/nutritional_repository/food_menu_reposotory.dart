import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';

abstract class FoodMenuRepository {
  Future<FoodMenu?> getFoodMenu({
    required String id,
  });

  Future<FoodMenu?> postFoodMenu({
    required FoodMenu foodMenu,
  });

  Future<FoodMenu?> putFoodMenu({
    required String id,
    required FoodMenu foodMenu,
  });
}
