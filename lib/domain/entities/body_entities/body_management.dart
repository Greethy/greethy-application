import 'package:equatable/equatable.dart';

class BodySpecsManagement extends Equatable {
  final String? id;
  final String? ownId;
  final String? bodySpecsNowId;
  final List<String?>? bodySpecsOld;

  BodySpecsManagement({
    this.id,
    this.ownId,
    this.bodySpecsNowId,
    this.bodySpecsOld,
  });

  @override
  List<Object?> get props => [
        id,
        ownId,
        bodySpecsNowId,
        bodySpecsOld,
      ];
}
