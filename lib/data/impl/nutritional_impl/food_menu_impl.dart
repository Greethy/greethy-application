import 'package:greethy_application/data/dto/nutrition_dto/food_menu_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/food_menu_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_menu_reposotory.dart';

class FoodMenuRepositoryImpl implements FoodMenuRepository {
  final FoodMenuApi _api;

  FoodMenuRepositoryImpl({
    required FoodMenuApi api,
  }) : _api = api;

  @override
  Future<FoodMenu?> getFoodMenu({required String id}) async {
    final FoodMenuDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toFoodMenu();
  }

  @override
  Future<FoodMenu?> postFoodMenu({required FoodMenu foodMenu}) async {
    final FoodMenuDto? fetched = await _api.post(foodMenu);
    return fetched == null ? null : fetched.toFoodMenu();
  }

  @override
  Future<FoodMenu?> putFoodMenu({required String id, required FoodMenu foodMenu}) async {
    final FoodMenuDto? fetched = await _api.put(id, foodMenu);
    return fetched == null ? null : fetched.toFoodMenu();
  }
}
