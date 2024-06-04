import 'package:greethy_application/domain/entities/body_entities/body_management.dart';
import 'package:greethy_application/domain/entities/body_entities/body_management.dart';
import 'package:greethy_application/domain/repository/body_repository/body_management_repository.dart';

class PutBodySpecsManagement {
  PutBodySpecsManagement({
    required BodySpecsManagementRepository repository,
  }) : _repository = repository;

  final BodySpecsManagementRepository _repository;

  Future<BodySpecsManagement?> call({
    required BodySpecsManagement bodySpecsManagement,
    required String id,
  }) async {
    final BodySpecsManagement? result = await _repository.putBodySpecsManagement(BodySpecsManagement: bodySpecsManagement, id: id);
    return result;
  }
}
