import 'package:desktop/mappings/map.dart';

class EntityType implements Mapping<EntityType> {
  final int? id;
  final String? atualizadoEm;
  final String? criadoEm;
  final String? descricao;
  final bool? produtor;

  const EntityType(
      {this.id,
      this.atualizadoEm,
      this.criadoEm,
      this.descricao,
      this.produtor});

  @override
  EntityType fromMap(Map<String, dynamic> map) {
    return EntityType(
      id: map['id'] as int,
      atualizadoEm: map['atualizadoEm'],
      criadoEm: map['criadoEm'],
      descricao: map['descricao'],
    );
  }
}
