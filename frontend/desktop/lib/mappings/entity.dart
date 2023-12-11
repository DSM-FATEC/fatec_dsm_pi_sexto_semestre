import 'package:desktop/mappings/entity_type.dart';
import 'package:desktop/mappings/map.dart';
import 'package:desktop/utils/date_utils.dart';

class Entity implements Mapping<Entity> {
  final int? id;
  final String? atualizadoEm;
  final String? criadoEm;
  final String? descricao;
  final String? cep;
  final String? complemento;
  final String? endereco;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final EntityType? tipo;

  Entity(
      {this.id,
      this.atualizadoEm,
      this.criadoEm,
      this.descricao,
      this.cep,
      this.complemento,
      this.endereco,
      this.bairro,
      this.cidade,
      this.estado,
      this.tipo});

  @override
  Entity fromMap(Map<String, dynamic> map) {
    return Entity(
        id: map['id'],
        atualizadoEm: DateUtils.format(map['atualizadoEm']),
        criadoEm: DateUtils.format(map['criadoEm']),
        descricao: map['descricao'],
        cep: map['cep'],
        complemento: map['complemento'],
        endereco: map['endereco'],
        bairro: map['bairro'],
        cidade: map['cidade'],
        estado: map['estado'],
        tipo: const EntityType().fromMap(map['tipo']));
  }
}
