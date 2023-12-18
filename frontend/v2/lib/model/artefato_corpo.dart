import 'package:json_annotation/json_annotation.dart';

part 'artefato_corpo.g.dart';

@JsonSerializable()
class Corpo {
  String? mensagem;


  Corpo({this.mensagem});

  factory Corpo.fromJson(Map<String, dynamic> json) => _$CorpoFromJson(json);

  Map<String, dynamic> toJson() => _$CorpoToJson(this);
}