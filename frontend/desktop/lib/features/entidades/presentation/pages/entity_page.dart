import 'package:desktop/features/entidades/presentation/pages/entity_form_page.dart';
import 'package:flutter/material.dart';

class EntityTypePage extends StatelessWidget {
  const EntityTypePage({super.key});

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
                  ));
            },
            child: const Text('Cadastrar'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(
          leading: Text(index.toString()),
          title: Text('Linha: $index'),
        ),
      ),
    );
  }
}
