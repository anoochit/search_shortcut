import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:search_shortcut/app/routes/app_pages.dart';
import 'package:search_shortcut/pages/search/views/search_view.dart';

import '../controllers/home_controller.dart';

class SearchIntent extends Intent {
  const SearchIntent();
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.shift,
          LogicalKeyboardKey.keyK,
        ): const SearchIntent(),
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
          child: Scaffold(
            appBar: AppBar(
              title: const Text('HomeView'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                'HomeView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
