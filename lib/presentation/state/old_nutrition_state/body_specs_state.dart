import 'package:greethy_application/domain/entities/body_entities/body_specs.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/get_body_specs.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/post_body_specs.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/put_body_specs.dart';


import '../appState.dart';

class BodySpecsState extends AppState {
  BodySpecsState({
    required CaseGetBodySpecs getBodySpecs,
    required CasePostBodySpecs postBodySpecs,
    required CasePutBodySpecs putBodySpecs,
  })  : _getBodySpecs = getBodySpecs,
        _postBodySpecs = postBodySpecs,
        _putBodySpecs = putBodySpecs;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseGetBodySpecs _getBodySpecs;
  final CasePostBodySpecs _postBodySpecs;
  final CasePutBodySpecs _putBodySpecs;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late BodySpecs? _bodySpecs;

  BodySpecs? get bodySpecs => _bodySpecs;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getBodySpecs(String id) async {
    isBusy = true;
    _bodySpecs = await _getBodySpecs.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postBodySpecs(BodySpecs bodySpecs) async {
    isBusy = true;
    _bodySpecs = await _postBodySpecs.call(bodySpecs: bodySpecs);
    isBusy = false;
  }

  /// put body specs
  Future<void> putBodySpecs(String id, BodySpecs bodySpecs) async {
    isBusy = true;
    _bodySpecs = await _putBodySpecs.call(id: id, bodySpecs: bodySpecs);
    isBusy = false;
  }
}
