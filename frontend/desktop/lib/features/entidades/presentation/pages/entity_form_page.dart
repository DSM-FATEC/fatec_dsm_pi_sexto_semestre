import 'package:flutter/material.dart';

class EntityFormPage extends StatelessWidget {
  const EntityFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo tipo de entidade'),
      ),
      body: Container(
        margin: const EdgeInsets.all(64),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: TextField(
                decoration:
                    InputDecoration(filled: true, labelText: 'Descrição'),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
