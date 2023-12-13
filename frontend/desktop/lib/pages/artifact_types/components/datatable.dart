import 'package:desktop/mappings/artifact_type.dart';
import 'package:flutter/material.dart';

class ArtifactTypeDataTable extends StatelessWidget {
  final List<ArtifactType> artifactTypes;

  const ArtifactTypeDataTable({
    super.key,
    required this.artifactTypes,
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
          label: Text('Produtor'),
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
      rows: artifactTypes.map((artifactType) {
        return DataRow(
          cells: [
            DataCell(
              Text(artifactType.id!.toString()),
            ),
            DataCell(
              Text(artifactType.descricao!),
            ),
            DataCell(
              Checkbox(
                value: artifactType.produtor!,
                onChanged: null,
              ),
            ),
            DataCell(
              Text(artifactType.criadoEm!),
            ),
            DataCell(
              Text(artifactType.atualizadoEm!),
            ),
          ],
        );
      }).toList(),
    );
  }
}
