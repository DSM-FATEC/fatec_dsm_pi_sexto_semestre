// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artefato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artefato _$ArtefatoFromJson(Map<String, dynamic> json) => Artefato(
      ativo: json['ativo'] as bool?,
      id: json['id'] as String?,
      criadoEm: json['criado_em'] as String?,
      descricao: json['descricao'] as String?,
      idEntidade: json['id_entidade'] as String?,
      idTipo: json['id_tipo'] as String?,
      comportamentos: (json['comportamentos'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ArtefatoToJson(Artefato instance) => <String, dynamic>{
      'ativo': instance.ativo,
      'id': instance.id,
      'criado_em': instance.criadoEm,
      'descricao': instance.descricao,
      'id_entidade': instance.idEntidade,
      'id_tipo': instance.idTipo,
      'comportamentos': instance.comportamentos,
    };
