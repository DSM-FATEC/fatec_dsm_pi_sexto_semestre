import 'package:desktop/connectors/apicruds_connector.dart';
import 'package:desktop/mappings/entity.dart';

class EntityConnector extends ApiCrudsConnector<Entity> {
  Future<List<Entity>> getAll() async {
    return super.get('entidade', Entity());
  }
}