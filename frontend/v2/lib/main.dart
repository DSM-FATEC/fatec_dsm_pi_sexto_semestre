import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/pages/alerts_screen.dart';
import 'package:frontend/pages/login/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amberAccent,
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF4E4B44),
          iconTheme: IconThemeData(
            color: Colors.white60,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AlertsScreenHome(),
    );
  }
}
