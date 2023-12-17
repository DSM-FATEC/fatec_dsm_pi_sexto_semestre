import 'package:flutter/material.dart';
import 'package:frontend/pages/alerts_screen.dart';
import 'package:frontend/pages/login/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colors.purple
          // brightness: Brightness.light
          ),
      debugShowCheckedModeBanner: false,
      home: const AlertsScreenHome(),
    );
  }
}
