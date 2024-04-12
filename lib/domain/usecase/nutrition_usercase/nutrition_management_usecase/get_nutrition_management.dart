import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/nutrition_management_repository.dart';

class GetNutritionManagement {
  GetNutritionManagement({
    required NutritionManagementRepository repository,
  }) : _repository = repository;

  final NutritionManagementRepository _repository;

  Future<NutritionManagement?> call() async {
    final NutritionManagement? nutritionManagement = await _repository.getNutritionManagement();
    return nutritionManagement;
  }
}
