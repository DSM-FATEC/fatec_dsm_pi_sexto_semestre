import 'package:desktop/connectors/apicruds_connector.dart';
import 'package:desktop/mappings/artifact.dart';

class ArtifactConnector extends ApiCrudsConnector<Artifact> {
  Future<List<Artifact>> getAll() async {
    return super.get('artefato', Artifact());
  }
}
