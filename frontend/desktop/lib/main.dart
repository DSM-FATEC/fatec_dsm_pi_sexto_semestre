import 'dart:io';

import 'package:desktop/features/home/presentation/home_page.dart';
import 'package:desktop/ui/menus.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMaxWindowSize(Size.infinite);
    await DesktopWindow.setMinWindowSize(const Size(700, 500));
    await DesktopWindow.setWindowSize(const Size(700, 500));
  }
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    if (Platform.isWindows) {
      ref.read(menuProvider).createWindowsMenu();
    }
  }

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.amber,
      iconTheme: IconThemeData(color: Colors.black38),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
  );

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: ref.read(menuProvider).createMenus(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        showSemanticsDebugger: false,
        theme: lightTheme,
        home: HomePage(),
      ),
    );
  }
}
