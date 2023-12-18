import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model/alert_event_model.dart';
import 'package:frontend/model/artefato_model.dart';
import 'package:frontend/model/data_model.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AlertsScreenHome extends StatefulWidget {
  const AlertsScreenHome({super.key});

  @override
  State<AlertsScreenHome> createState() => _AlertsScreenHomeState();
}

class _AlertsScreenHomeState extends State<AlertsScreenHome> {
  int _counter = 0;
  late FirebaseFirestore _firestore;

  final Stream<QuerySnapshot> _artefactStream =
      FirebaseFirestore.instance.collection('artefacts').snapshots();

  @override
  void initState() {
    _firestore = FirebaseFirestore.instance;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _firestore
          .collection('artefacts')
          .add({
            "artefato": {
              "id": "1c6a31d1-9255-4dfa-80da-cb7a5b983c1a",
              "id_tipo": "1c6a31d1-9255-4dfa-80da-cb7a5b983c1a",
              "id_entidade": "1c6a31d1-9255-4dfa-80da-cb7a5b983c1a",
              "descricao": "semaforo",
              "ativo": true,
              "comportamentos": {"a": "b"},
              "criado_em": "2023-03-10T19:34:00Z"
            },
            "corpo": {"mensagem": "teste"}
          })
          .then((value) => print('Success! ID: ${value.id}'))
          .catchError((error) => print('$error'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guia-me V2"),
      ),
      drawer: const Drawer(),
      body: StreamBuilder(
        stream: _artefactStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                ),
              ),
            );
          }

          var data = snapshot.data.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var artefact = data[index] as DocumentSnapshot;
              // return Text(artefact.data().toString());
              final dataModel =
                  DataModel.fromJson(artefact.data() as Map<String, dynamic>);
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Text(
                      '${dataModel.artefato?.id?.substring(1, 4)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${dataModel.artefato?.descricao}'),
                      Text('Criado em ${dataModel.artefato?.criadoEm}', style: Theme.of(context).textTheme.labelSmall,),
                    ],
                  ),
                  subtitle: Text('Mensagem: ${dataModel.corpo?.mensagem}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
