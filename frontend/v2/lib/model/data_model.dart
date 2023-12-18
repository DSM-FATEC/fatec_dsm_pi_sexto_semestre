import 'package:frontend/model/artefato_corpo.dart';
import 'package:frontend/model/artefato_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  Artefato? artefato;
  Corpo? corpo;

  DataModel({this.artefato, this.corpo});

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}