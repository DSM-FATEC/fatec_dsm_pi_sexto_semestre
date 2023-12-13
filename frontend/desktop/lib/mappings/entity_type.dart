import 'package:desktop/mappings/map.dart';
import 'package:desktop/utils/date_utils.dart';

class EntityType implements Mapping<EntityType> {
  final int? id;
  final String? atualizadoEm;
  final String? criadoEm;
  final String? descricao;

  const EntityType({this.id, this.atualizadoEm, this.criadoEm, this.descricao});

  @override
  EntityType fromMap(Map<String, dynamic> map) {
    return EntityType(
        id: map['id'],
        descricao: map['descricao'],
        atualizadoEm: DateUtils.format(map['atualizadoEm']),
        criadoEm: DateUtils.format(map['criadoEm']));
  }
}
