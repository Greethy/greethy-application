import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';

class BodySpecsDto extends BodySpecs {
  BodySpecsDto({
    super.id,
    super.age,
    super.height,
    super.weight,
    super.bmi,
    super.pal,
    super.bmr,
    super.createdAt,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory BodySpecsDto.fromRawJson(String str) => BodySpecsDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory BodySpecsDto.fromMap(Map<String, dynamic> json) => BodySpecsDto(
    id: json['id'],
    age: json['age'],
    height: json['height'],
    weight: json['weight'],
    bmi: json['bmi'] == null ? null : BmiDto.fromMap(json['bmi']),
    pal: json['pal'] == null ? null : PalDto.fromMap(json['pal']),
    bmr: json['bmr'] == null ? null : BmrDto.fromMap(json['bmr']),
    createdAt: json['create_at'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'age': age,
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'pal': pal,
      'bmr': bmr,
      'create_at': createdAt,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static BodySpecsDto fromBodySpecs(BodySpecs bodySpecs) {
    return BodySpecsDto(
      id: bodySpecs.id,
      age: bodySpecs.age,
      height: bodySpecs.height,
      weight: bodySpecs.weight,
      bmi: bodySpecs.bmi,
      pal: bodySpecs.pal,
      bmr: bodySpecs.bmr,
      createdAt: bodySpecs.createdAt,
    );
  }

  BodySpecs toBodySpecs() {
    return BodySpecs(
      id: id,
      age: age,
      height: height,
      weight: weight,
      bmi: bmi,
      pal: pal,
      bmr: bmr,
      createdAt: createdAt,
    );
  }
}

class BmiDto extends Bmi {
  BmiDto({
    super.index,
    super.status,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory BmiDto.fromRawJson(String str) => BmiDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory BmiDto.fromMap(Map<String, dynamic> json) => BmiDto(
    index: json['index'],
    status: json['status'],
  );

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'status': status,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static BmiDto fromBmi(Bmi bmi) {
    return BmiDto(
      index: bmi.index,
      status: bmi.status,
    );
  }

  Bmi toBmi() {
    return Bmi(
      index: index,
      status: status,
    );
  }
}

class PalDto extends Pal {
  PalDto({
    super.typeOfActivity,
    super.value,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PalDto.fromRawJson(String str) => PalDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PalDto.fromMap(Map<String, dynamic> json) => PalDto(
    typeOfActivity: json['typeOfActivity'],
    value: json['value'],
  );

  Map<String, dynamic> toMap() {
    return {
      'typeOfActivity': typeOfActivity,
      'value': value,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static PalDto fromPal(Pal pal) {
    return PalDto(
      typeOfActivity: pal.typeOfActivity,
      value: pal.value,
    );
  }

  Pal toPal() {
    return Pal(
      typeOfActivity: typeOfActivity,
      value: value,
    );
  }
}

class BmrDto extends Bmr {
  BmrDto({
    super.bmrPerKg,
    super.bmrPerDay,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory BmrDto.fromRawJson(String str) => BmrDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory BmrDto.fromMap(Map<String, dynamic> json) => BmrDto(
    bmrPerKg: json['bmrPerKg'],
    bmrPerDay: json['bmrPerDay'],
  );

  Map<String, dynamic> toMap() {
    return {
      'bmrPerKg': bmrPerKg,
      'bmrPerDay': bmrPerDay,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static BmrDto fromBmr(Bmr bmr) {
    return BmrDto(
      bmrPerKg: bmr.bmrPerKg,
      bmrPerDay: bmr.bmrPerDay,
    );
  }

  Bmr toBmr() {
    return Bmr(
      bmrPerKg: bmrPerKg,
      bmrPerDay: bmrPerDay,
    );
  }
}
