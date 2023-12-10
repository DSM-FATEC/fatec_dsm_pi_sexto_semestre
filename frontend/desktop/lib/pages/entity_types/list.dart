import 'package:desktop/connectors/entity_type_connector.dart';
import 'package:desktop/mappings/entity_type.dart';
import 'package:desktop/pages/entity_types/components/datatable.dart';
import 'package:desktop/pages/entity_types/form.dart';
import 'package:flutter/material.dart';

class EntityTypePage extends StatefulWidget {
  const EntityTypePage({super.key});

  @override
  State<EntityTypePage> createState() => _EntityTypePageState();
}

class _EntityTypePageState extends State<EntityTypePage> {
  late Future<List<EntityType>> entityTypes;

  @override
  void initState() {
    super.initState();

    entityTypes = EntityTypeConnector().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Entidades'),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EntityFormPage(),
                ),
              );
            },
            child: const Text('Cadastrar'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: entityTypes,
        builder: (context, snap) {
          if (!snap.hasData) {
            return const CircularProgressIndicator();
          }

          return EntityTypeDataTable(entityTypes: snap.data!);
        },
      ),
    );
  }
}
