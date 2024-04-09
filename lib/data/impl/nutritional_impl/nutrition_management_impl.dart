import 'package:greethy_application/data/dto/nutrition_dto/nutrition_management_dto.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/nutritional_api/nutritional_management_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/nutrition_management_repository.dart';

class NutritionManagementRepositoryImpl implements NutritionManagementRepository {
  final NutritionManagementApi _api;
  final LocalStorageUser _localStorage;

  NutritionManagementRepositoryImpl({
    required NutritionManagementApi api,
    required LocalStorageUser localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<NutritionManagement?> getNutritionManagement() async {
    print("getNutritionManagement NutritionManagementRepositoryImpl");
    String? id = await _localStorage.loadUser().id;
    if (id == null || id == ""){
      // todo add test
      // return null;

      final NutritionManagementDto? fetched = await _api.get("0");
      return fetched == null ? null : fetched.toNutritionManagement();
    }
    final NutritionManagementDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toNutritionManagement();
  }

  @override
  Future<NutritionManagement?> postNutritionManagement({required NutritionManagement nutritionManagement}) async {
    final NutritionManagementDto? fetched = await _api.post(nutritionManagement);
    return fetched == null ? null : fetched.toNutritionManagement();
  }

  @override
  Future<NutritionManagement?> putNutritionManagement({required String id, required NutritionManagement nutritionManagement}) async {
    final NutritionManagementDto? fetched = await _api.put(id, nutritionManagement);
    return fetched == null ? null : fetched.toNutritionManagement();
  }
}
