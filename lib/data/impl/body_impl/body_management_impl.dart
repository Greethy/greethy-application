import 'package:greethy_application/data/dto/body_dto/body_management_dto.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/body_api/body_management_api.dart';
import 'package:greethy_application/domain/entities/body_entities/body_management.dart';
import 'package:greethy_application/domain/repository/body_repository/body_management_repository.dart';

class BodySpecsManagementRepositoryImpl implements BodySpecsManagementRepository {
  final BodySpecsManagementApi _api;
  final LocalStorageUser _localStorage;

  BodySpecsManagementRepositoryImpl({
    required BodySpecsManagementApi api,
    required LocalStorageUser localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<BodySpecsManagement?> getBodySpecsManagement() async {
    String? id = await _localStorage.loadUser().id;
    if (id == null || id == "") {
      // todo add test
      // return null;

      final BodySpecsManagementDto? fetched = await _api.get("0");
      return fetched == null ? null : fetched.toBodySpecsManagement();
    }
    final BodySpecsManagementDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toBodySpecsManagement();
  }

  @override
  Future<BodySpecsManagement?> postBodySpecsManagement({required BodySpecsManagement BodySpecsManagement}) async {
    final BodySpecsManagementDto? fetched = await _api.post(BodySpecsManagement);
    return fetched == null ? null : fetched.toBodySpecsManagement();
  }

  @override
  Future<BodySpecsManagement?> putBodySpecsManagement({required String id, required BodySpecsManagement BodySpecsManagement}) async {
    final BodySpecsManagementDto? fetched = await _api.put(id, BodySpecsManagement);
    return fetched == null ? null : fetched.toBodySpecsManagement();
  }
}
