import 'package:desktop/pages/entity_types/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexStateProvider = StateProvider<int>((ref) => 0);

_buildMockPage(String title) {
  return Expanded(
    child: Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          FilledButton(
            onPressed: () {},
            child: const Text('Cadastrar'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(
          leading: Text(index.toString()),
          title: Text('Linha: $index'),
        ),
      ),
    ),
  );
}

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final pages = [
    const EntityTypePage(),
    Container(color: Colors.blue.shade300),
    Container(color: Colors.purple.shade300),
    Container(color: Colors.pink.shade300),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: ref.watch(indexStateProvider),
            onDestinationSelected: (value) {
              ref.read(indexStateProvider.notifier).state = value;
              print('index: ${ref.read(indexStateProvider.notifier).state}');
            },
            labelType: NavigationRailLabelType.none,
            elevation: 4,
            leading: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.amber.shade700,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'GuiaMe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.category_outlined),
                selectedIcon: Icon(Icons.category),
                label: Text('Tipos de Entidade'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.dataset_outlined),
                selectedIcon: Icon(Icons.dataset),
                label: Text('Entidades'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.category_outlined),
                selectedIcon: Icon(Icons.category),
                label: Text('Tipos de Artefatos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.developer_board_outlined),
                selectedIcon: Icon(Icons.developer_board),
                label: Text('Artefatos'),
              ),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(child: pages[ref.watch(indexStateProvider)]),
        ],
      ),
    );
  }
}
