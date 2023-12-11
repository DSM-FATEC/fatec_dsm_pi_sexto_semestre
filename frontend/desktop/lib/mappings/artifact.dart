import 'package:desktop/mappings/artifact_type.dart';
import 'package:desktop/mappings/map.dart';
import 'package:desktop/utils/date_utils.dart';

class Artifact implements Mapping<Artifact> {
  final int? id;
  final bool? ativo;
  final String? atualizadoEm;
  final String? criadoEm;
  final String? descricao;
  final String? wifi;
  final ArtifactType? tipo;
  final Map<String, dynamic>? comportamentos;

  Artifact(
      {this.id,
      this.ativo,
      this.atualizadoEm,
      this.criadoEm,
      this.descricao,
      this.wifi,
      this.tipo,
      this.comportamentos});

  @override
  Artifact fromMap(Map<String, dynamic> map) {
    return Artifact(
        id: map['id'],
        ativo: map['ativo'],
        atualizadoEm: DateUtils.format(map['atualizadoEm']),
        criadoEm: DateUtils.format(map['criadoEm']),
        descricao: map['descricao'],
        wifi: map['wifi'],
        tipo: ArtifactType().fromMap(map['tipo']),
        comportamentos: map['comportamentos']);
  }
}
