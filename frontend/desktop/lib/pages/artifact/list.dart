import 'package:desktop/connectors/artifact_connector.dart';
import 'package:desktop/mappings/artifact.dart';
import 'package:desktop/pages/artifact/components/datatable.dart';
import 'package:flutter/material.dart';

class ArtifactPage extends StatefulWidget {
  const ArtifactPage({super.key});

  @override
  State<ArtifactPage> createState() => ArtifactPageState();
}

class ArtifactPageState extends State<ArtifactPage> {
  late Future<List<Artifact>> artifacts;

  @override
  void initState() {
    super.initState();

    artifacts = ArtifactConnector().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artefatos'),
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
        future: artifacts,
        builder: (context, snap) {
          if (!snap.hasData) {
            return const CircularProgressIndicator();
          }

          return ArtifactDataTable(artifacts: snap.data!);
        },
      ),
    );
  }
}
