

import 'package:greethy_application/domain/entities/body_entities/body_management.dart';

abstract class BodySpecsManagementRepository {
  Future<BodySpecsManagement?> getBodySpecsManagement();

  Future<BodySpecsManagement?> postBodySpecsManagement({
    required BodySpecsManagement BodySpecsManagement,
  });

  Future<BodySpecsManagement?> putBodySpecsManagement({
    required String id,
    required BodySpecsManagement BodySpecsManagement,
  });
}
