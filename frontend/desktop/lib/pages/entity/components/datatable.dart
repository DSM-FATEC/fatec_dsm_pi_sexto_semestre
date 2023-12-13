import 'package:desktop/mappings/entity.dart';
import 'package:flutter/material.dart';

class EntityDataTable extends StatelessWidget {
  final List<Entity> entities;

  const EntityDataTable({
    super.key,
    required this.entities,
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
          label: Text('Tipo'),
          numeric: false,
        ),
        DataColumn(
          label: Text('CEP'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Complemento'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Endereço'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Bairro'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Cidade'),
          numeric: false,
        ),
        DataColumn(
          label: Text('Estado'),
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
      rows: entities.map((entity) {
        return DataRow(
          cells: [
            DataCell(
              Text(entity.id!.toString()),
            ),
            DataCell(
              Text(entity.descricao!),
            ),
            DataCell(
              Text(entity.tipo!.descricao!),
            ),
            DataCell(
              Text(entity.cep!),
            ),
            DataCell(
              Text(entity.complemento!),
            ),
            DataCell(
              Text(entity.endereco!),
            ),
            DataCell(
              Text(entity.bairro!),
            ),
            DataCell(
              Text(entity.cidade!),
            ),
            DataCell(Text(entity.estado!)),
            DataCell(
              Text(entity.criadoEm!),
            ),
            DataCell(
              Text(entity.atualizadoEm!),
            ),
          ],
        );
      }).toList(),
    );
  }
}
