import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/get_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/post_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/put_body_specs.dart';

import '../appState.dart';

class BodySpecsState extends AppState {
  BodySpecsState({
    required GetBodySpecs getBodySpecs,
    required PostBodySpecs postBodySpecs,
    required PutBodySpecs putBodySpecs,
  })  : _getBodySpecs = getBodySpecs,
        _postBodySpecs = postBodySpecs,
        _putBodySpecs = putBodySpecs;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetBodySpecs _getBodySpecs;
  final PostBodySpecs _postBodySpecs;
  final PutBodySpecs _putBodySpecs;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late BodySpecs? _bodySpecs;

  BodySpecs? get collectiveModel => _bodySpecs;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getBodySpecsMySelf(String id) async {
    isBusy = true;
    _bodySpecs = await _getBodySpecs.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postBodySpecsMySelf(BodySpecs bodySpecs) async {
    isBusy = true;
    _bodySpecs = await _postBodySpecs.call(bodySpecs: bodySpecs);
    isBusy = false;
  }

  /// put body specs
  Future<void> putBodySpecsMySelf(String id, BodySpecs bodySpecs) async {
    isBusy = true;
    _bodySpecs = await _putBodySpecs.call(id: id, bodySpecs: bodySpecs);
    isBusy = false;
  }
}
