import 'package:greethy_application/domain/entities/body_entities/body_specs.dart';
import 'package:greethy_application/domain/repository/body_repository/body_specs_repository.dart';

class CaseGetBodySpecs {
  CaseGetBodySpecs({
    required BodySpecsRepository repository,
  }) : _repository = repository;

  final BodySpecsRepository _repository;

  Future<BodySpecs?> call({
    required String id,
  }) async {
    final BodySpecs? user = await _repository.getBodySpecs(id: id);
    return user;
  }
}
