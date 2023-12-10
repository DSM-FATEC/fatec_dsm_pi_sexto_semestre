import 'package:desktop/mappings/entity_type.dart';
import 'package:flutter/material.dart';

class EntityTypeDataTable extends StatelessWidget {
  final List<EntityType> entityTypes;

  const EntityTypeDataTable({
    super.key,
    required this.entityTypes,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text('ID'),
          numeric: true,
        ),
        DataColumn(
          label: Text('Descrição'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Criado Em'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Atualizado Em'),
          numeric: false,
        ),
      ],
      rows: entityTypes.map((entityType) {
        return DataRow(
          cells: [
            DataCell(
              Text(entityType.id!.toString()),
            ),
            DataCell(
              Text(entityType.descricao!),
            ),
            DataCell(
              Text(entityType.criadoEm!),
            ),
            DataCell(
              Text(entityType.atualizadoEm!),
            ),
          ],
        );
      }).toList(),
    );
  }
}
