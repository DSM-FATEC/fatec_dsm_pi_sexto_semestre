import 'package:desktop/mappings/artifact.dart';
import 'package:flutter/material.dart';

class ArtifactDataTable extends StatelessWidget {
  final List<Artifact> artifacts;

  const ArtifactDataTable({
    super.key,
    required this.artifacts,
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
          label: Text('Ativo'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Wi-fi'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Tipo'),
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
      rows: artifacts.map((artifact) {
        return DataRow(
          cells: [
            DataCell(
              Text(artifact.id!.toString()),
            ),
            DataCell(
              Text(artifact.descricao!),
            ),
            DataCell(
              Checkbox(
                value: artifact.ativo!,
                onChanged: null,
              ),
            ),
            DataCell(
              Text(artifact.wifi!),
            ),
            DataCell(
              Text(artifact.tipo!.descricao!)
            ),
            DataCell(
              Text(artifact.criadoEm!),
            ),
            DataCell(
              Text(artifact.atualizadoEm!),
            ),
          ],
        );
      }).toList(),
    );
  }
}
