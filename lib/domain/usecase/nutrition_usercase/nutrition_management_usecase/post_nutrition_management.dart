import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/nutrition_management_repository.dart';

class CasePostNutritionManagement {
  CasePostNutritionManagement({
    required NutritionManagementRepository repository,
  }) : _repository = repository;

  final NutritionManagementRepository _repository;

  Future<NutritionManagement?> call({
    required NutritionManagement nutritionManagement,
  }) async {
    final NutritionManagement? result = await _repository.postNutritionManagement(nutritionManagement: nutritionManagement);
    return result;
  }
}
