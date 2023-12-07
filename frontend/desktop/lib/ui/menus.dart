import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menubar/menubar.dart';

final menuProvider = Provider<MenuProvider>((ref) => MenuProvider(ref: ref));

class MenuProvider {
  final ProviderRef ref;

  MenuProvider({
    required this.ref,
  });

  List<PlatformMenu> createMenus() {
    return [createFileMenu()];
  }

  createWindowsMenu() {
    setApplicationMenu([createWindowsFileMenu()]);
  }

  PlatformMenu createFileMenu() {
    return PlatformMenu(label: 'File', menus: [
      PlatformMenuItem(
          label: 'Import', onSelected: () => print('Import Menu.')),
      PlatformMenuItem(
          label: 'Export', onSelected: () => print('Import Menu.')),
      PlatformMenuItemGroup(members: [
        PlatformMenuItem(
          label: 'Quit',
          onSelected: () => handleQuit(),
          shortcut: const SingleActivator(
            LogicalKeyboardKey.keyQ,
            meta: true,
          ),
        ),
      ]),
    ]);
  }

  NativeSubmenu createWindowsFileMenu() {
    return NativeSubmenu(label: 'File', children: [
      NativeMenuItem(label: 'Import', onSelected: () => print('Native Import')),
      NativeMenuItem(label: 'Export', onSelected: () => print('Native Export')),
      NativeMenuItem(
        label: 'Quit',
        onSelected: () => handleQuit(),
        shortcut: LogicalKeySet(
          LogicalKeyboardKey.meta,
          LogicalKeyboardKey.keyQ,
        ),
      )
    ]);
  }

  handleQuit() {
    exit(0);
  }
}
