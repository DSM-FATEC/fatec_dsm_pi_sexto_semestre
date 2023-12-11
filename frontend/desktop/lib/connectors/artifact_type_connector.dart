import 'package:desktop/connectors/apicruds_connector.dart';
import 'package:desktop/mappings/artifact_type.dart';

class ArtifactTypeConnector extends ApiCrudsConnector<ArtifactType> {
  Future<List<ArtifactType>> getAll() async {
    return super.get('tipo_artefato', ArtifactType());
  }
}
