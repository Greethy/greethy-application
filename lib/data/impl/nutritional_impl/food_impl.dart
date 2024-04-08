import 'package:greethy_application/data/dto/nutrition_dto/food_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/food_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodApi _api;

  FoodRepositoryImpl({
    required FoodApi api,
  }) : _api = api;

  @override
  Future<Food?> getFood({required String id}) async {
    final FoodDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toFood();
  }

  @override
  Future<Food?> postFood({required Food food}) async {
    final FoodDto? fetched = await _api.post(food);
    return fetched == null ? null : fetched.toFood();
  }

  @override
  Future<Food?> putFood({required String id, required Food food}) async {
    final FoodDto? fetched = await _api.put(id, food);
    return fetched == null ? null : fetched.toFood();
  }
}
