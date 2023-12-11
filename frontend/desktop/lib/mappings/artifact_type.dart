import 'package:desktop/mappings/map.dart';
import 'package:desktop/utils/date_utils.dart';

class ArtifactType implements Mapping<ArtifactType> {
  final int? id;
  final String? atualizadoEm;
  final String? criadoEm;
  final String? descricao;
  final bool? produtor;

  ArtifactType(
      {this.id,
      this.atualizadoEm,
      this.criadoEm,
      this.descricao,
      this.produtor});

  @override
  ArtifactType fromMap(Map<String, dynamic> map) {
    return ArtifactType(
        id: map['id'],
        atualizadoEm: DateUtils.format(map['atualizadoEm']),
        criadoEm: DateUtils.format(map['criadoEm']),
        descricao: map['descricao'],
        produtor: map['produtor']);
  }
}
