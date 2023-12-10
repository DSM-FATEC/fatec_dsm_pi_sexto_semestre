import 'package:desktop/connectors/apicruds_connector.dart';
import 'package:desktop/mappings/entity_type.dart';

class EntityTypeConnector extends ApiCrudsConnector<EntityType> {
  Future<List<EntityType>> getAll() async {
    return super.get('tipo_entidade', const EntityType());
  }
}
