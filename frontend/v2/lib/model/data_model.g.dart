// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      artefato: json['artefato'] == null
          ? null
          : Artefato.fromJson(json['artefato'] as Map<String, dynamic>),
      corpo: json['corpo'] == null
          ? null
          : Corpo.fromJson(json['corpo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'artefato': instance.artefato,
      'corpo': instance.corpo,
    };
