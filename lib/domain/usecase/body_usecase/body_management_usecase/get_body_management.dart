import 'package:greethy_application/domain/entities/body_entities/body_management.dart';
import 'package:greethy_application/domain/repository/body_repository/body_management_repository.dart';

class CaseCaseGetBodySpecsManagement {
  CaseCaseGetBodySpecsManagement({
    required BodySpecsManagementRepository repository,
  }) : _repository = repository;

  final BodySpecsManagementRepository _repository;

  Future<BodySpecsManagement?> call() async {
    final BodySpecsManagement? bodySpecsManagement = await _repository.getBodySpecsManagement();
    return bodySpecsManagement;
  }
}
