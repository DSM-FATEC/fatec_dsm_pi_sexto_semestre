import 'dart:convert';

import 'package:frontend/model/alert_event_model.dart';
import 'package:flutter/material.dart';

class AlertsScreenHome extends StatefulWidget {
  const AlertsScreenHome({super.key});

  @override
  State<AlertsScreenHome> createState() => _AlertsScreenHomeState();
}

class _AlertsScreenHomeState extends State<AlertsScreenHome> {
  //Mock para conversão de JSON no WebSocket
  static const json = '''
  [
    {
    "id": 357,
    "artefato": {
        "id": 4,
        "tipo": {
            "id": 2,
            "descricao": "Semaforo",
            "produtor": true,
            "criado_em": "2023-05-25T00:58:25.216131",
            "atualizado_em": "2023-05-25T00:58:25.216131"
        },
        "entidade": {
            "id": 1,
            "tipo": {
                "id": 1,
                "descricao": "Prefeitura",
                "criado_em": "2023-05-25T00:58:14.545327",
                "atualizado_em": "2023-05-25T00:58:14.545327"
            },
            "descricao": "Prefeitura de teste",
            "cep": "13610-509",
            "complemento": null,
            "endereco": "Rua de teste",
            "bairro": "Bairro de teste",
            "cidade": "Cidade de teste",
            "estado": "SP",
            "criado_em": "2023-05-25T00:58:23.373413",
            "atualizado_em": "2023-05-25T00:58:23.373413"
        },
        "descricao": "Semaforo",
        "comportamentos": {
            "open_duration": 30,
            "closed_duration": 20
        },
        "ativo": true,
        "criado_em": "2023-05-25T00:59:40.695682",
        "atualizado_em": "2023-05-25T00:59:40.695682"
    },
    "corpo": {
        "estado": "Semáforo aberto"
    },
    "criado_em": "2023-06-21 01:12:05.710797",
    "atualizado_em": "2023-06-21 01:12:05.710797"
    }, 
    {
        "id": 357,
        "artefato": {
            "id": 4,
            "tipo": {
                "id": 2,
                "descricao": "Semaforo",
                "produtor": true,
                "criado_em": "2023-05-25T00:58:25.216131",
                "atualizado_em": "2023-05-25T00:58:25.216131"
            },
            "entidade": {
                "id": 1,
                "tipo": {
                    "id": 1,
                    "descricao": "Prefeitura",
                    "criado_em": "2023-05-25T00:58:14.545327",
                    "atualizado_em": "2023-05-25T00:58:14.545327"
                },
                "descricao": "Prefeitura de teste",
                "cep": "13610-509",
                "complemento": null,
                "endereco": "Rua de teste",
                "bairro": "Bairro de teste",
                "cidade": "Cidade de teste",
                "estado": "SP",
                "criado_em": "2023-05-25T00:58:23.373413",
                "atualizado_em": "2023-05-25T00:58:23.373413"
            },
            "descricao": "Semaforo",
            "comportamentos": {
                "open_duration": 30,
                "closed_duration": 20
            },
            "ativo": true,
            "criado_em": "2023-05-25T00:59:40.695682",
            "atualizado_em": "2023-05-25T00:59:40.695682"
        },
        "corpo": {
            "estado": "Semáforo aberto"
        },
        "criado_em": "2023-06-21 01:12:05.710797",
        "atualizado_em": "2023-06-21 01:12:05.710797"
    }
  ]
  ''';

  static var jsonMapList = jsonDecode(json);

  //Segue um exemplo de conversão.
  static List<Evento> eventos = jsonMapList.map<Evento>((e) {
    return Evento.fromJson(e);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia-Me'),
        scrolledUnderElevation: 4.0,
        shadowColor: Theme.of(context).shadowColor,
        leading: const Center(
          child: CircleAvatar(
            radius: 16,
            child: Icon(Icons.person),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          final evento = eventos[index];
          return Card(
            child: ListTile(
              onTap: () async {
                await exibirBottomSheet(context, evento);
              },
              leading: CircleAvatar(child: Text('${evento.artefato?.id}')),
              title: Text('${evento.artefato?.tipo?.descricao}'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('${evento.artefato?.entidade?.descricao}',
                      textAlign: TextAlign.left),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> exibirBottomSheet(BuildContext context, Evento evento) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Text('${evento.artefato?.id}')),
                title: Text('${evento.artefato?.tipo?.descricao}'),
                subtitle: Text(
                  '${evento.artefato?.entidade?.descricao}',
                  textAlign: TextAlign.left,
                ),
              ),
              const Divider(height: 5),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
