import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';

abstract class NutritionManagementRepository {
  Future<NutritionManagement?> getNutritionManagement({
    required String gmail,
    required String password,
    required String type,
  });

  Future<NutritionManagement?> postNutritionManagement({
    required String gmail,
    required String password,
    required String type,
  });

  Future<NutritionManagement?> putNutritionManagement({
    required String gmail,
    required String password,
    required String type,
  });
}
