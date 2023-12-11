import 'package:desktop/connectors/entity_connector.dart';
import 'package:desktop/mappings/entity.dart';
import 'package:desktop/pages/entity/components/datatable.dart';
import 'package:flutter/material.dart';

class EntityPage extends StatefulWidget {
  const EntityPage({super.key});

  @override
  State<EntityPage> createState() => _EntityTypePageState();
}

class _EntityTypePageState extends State<EntityPage> {
  final EntityConnector entityConnector = EntityConnector();
  late Future<List<Entity>> entities;

  @override
  void initState() {
    super.initState();

    entities = entityConnector.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entidades'),
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
        future: entities,
        builder: (context, snap) {
          if (!snap.hasData) {
            return const CircularProgressIndicator();
          }

          return EntityDataTable(entities: snap.data!);
        },
      ),
    );
  }
}
