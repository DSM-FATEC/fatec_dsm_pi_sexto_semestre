import 'package:desktop/connectors/artifact_type_connector.dart';
import 'package:desktop/mappings/artifact_type.dart';
import 'package:desktop/pages/artifact_types/components/datatable.dart';
import 'package:flutter/material.dart';

class ArtifactTypePage extends StatefulWidget {
  const ArtifactTypePage({super.key});

  @override
  State<ArtifactTypePage> createState() => _ArtifactTypePageState();
}

class _ArtifactTypePageState extends State<ArtifactTypePage> {
  late Future<List<ArtifactType>> artifactTypes;

  @override
  void initState() {
    super.initState();

    artifactTypes = ArtifactTypeConnector().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Artefato'),
        actions: [
          FilledButton(
            onPressed: () {
              // TODO
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const EntityFormPage(),
              //   ),
              // );
            },
            child: const Text('Cadastrar'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: artifactTypes,
        builder: (context, snap) {
          if (!snap.hasData) {
            return const CircularProgressIndicator();
          }

          return ArtifactTypeDataTable(artifactTypes: snap.data!);
        },
      ),
    );
  }
}
