import 'package:frontend/model/artefato_corpo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alert_event_model.dart';

part 'artefato_model.g.dart';

@JsonSerializable()
class Artefato {
  bool? ativo;
  String? id;
  @JsonKey(name: 'criado_em')
  String? criadoEm;
  String? descricao;
  @JsonKey(name: 'id_entidade')
  String? idEntidade;
  @JsonKey(name: 'id_tipo')
  String? idTipo;
  Map<String, String>? comportamentos = <String, String>{};
  Artefato({
    this.ativo,
    this.id,
    this.criadoEm,
    this.descricao,
    this.idEntidade,
    this.idTipo,
    this.comportamentos,
  });

  factory Artefato.fromJson(Map<String, dynamic> json) => _$ArtefatoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtefatoToJson(this);
}
