import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPage extends StatefulWidget {
  const WebSocketPage({super.key});

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  final uriWebSocket =
      'wss://guiame-api.3far1ivu8btka.us-east-1.cs.amazonlightsail.com/evento/ws/1';
  late WebSocketChannel channel;

  @override
  void initState() {
    channel = WebSocketChannel.connect(Uri.parse(uriWebSocket));
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebSocket')),
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: CircularProgressIndicator())),
            );
          }

          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            log(snapshot.data);
            //TODO: Converter json em lista de artefatos
            return Text(snapshot.data);
          }

          return const Center(child: (Text('Sem dados no momento.')));
        },
      ),
    );
  }
}
