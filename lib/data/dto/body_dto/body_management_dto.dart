import 'dart:convert';

import 'package:greethy_application/domain/entities/body_entities/body_management.dart';

class BodySpecsManagementDto extends BodySpecsManagement {
  BodySpecsManagementDto({
    super.id,
    super.ownId,
    super.bodySpecsOld,
    super.bodySpecsNowId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory BodySpecsManagementDto.fromRawJson(String str) => BodySpecsManagementDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory BodySpecsManagementDto.fromMap(Map<String, dynamic> json) => BodySpecsManagementDto(
        id: json['id'],
        ownId: json['userId'],
        bodySpecsNowId: json['body_specs_now'],
        bodySpecsOld: json['body_specs_old'] == null ? [] : List<String>.from(json['body_specs_old']),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': ownId,
      'body_specs_now': bodySpecsNowId,
      'body_specs_old': bodySpecsOld == null ? [] : bodySpecsOld,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static BodySpecsManagementDto fromBodySpecsManagement(BodySpecsManagement BodySpecsManagement) {
    return BodySpecsManagementDto(
      id: BodySpecsManagement.id,
      ownId: BodySpecsManagement.ownId,
      bodySpecsOld: BodySpecsManagement.bodySpecsOld,
      bodySpecsNowId: BodySpecsManagement.bodySpecsNowId,
    );
  }

  BodySpecsManagement toBodySpecsManagement() {
    return BodySpecsManagement(
      id: id,
      ownId: ownId,
      bodySpecsNowId: bodySpecsNowId,
      bodySpecsOld: bodySpecsOld,
    );
  }
}
