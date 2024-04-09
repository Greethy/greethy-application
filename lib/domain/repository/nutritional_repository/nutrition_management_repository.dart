import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';

abstract class NutritionManagementRepository {
  Future<NutritionManagement?> getNutritionManagement();

  Future<NutritionManagement?> postNutritionManagement({
    required NutritionManagement nutritionManagement,
  });

  Future<NutritionManagement?> putNutritionManagement({
    required String id,
    required NutritionManagement nutritionManagement,
  });
}
