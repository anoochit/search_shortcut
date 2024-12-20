import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:search_shortcut/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class SearchIntent extends Intent {
  const SearchIntent();
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    LogicalKeySet shortcutKey;

    if (Platform.isMacOS) {
      // Cmd+K for macOS
      shortcutKey = LogicalKeySet(
        LogicalKeyboardKey.meta,
        LogicalKeyboardKey.keyK,
      );
    } else {
      // Ctrl+K for Windows/Linux/other platforms
      shortcutKey = LogicalKeySet(
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.keyK,
      );
    }

    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        shortcutKey: const SearchIntent(),
      },
      child: Actions(
        actions: {
          SearchIntent: CallbackAction<SearchIntent>(
            onInvoke: (SearchIntent intent) async {
              await Get.toNamed(Routes.SEARCH);
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('HomeView'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: IconButton.filledTonal(
                    tooltip: 'Ctrl+K',
                    onPressed: () => Get.toNamed(Routes.SEARCH),
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ],
            ),
            body: const Center(
              child: Text(
                'Ctrl+K for Search',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
