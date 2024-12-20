import 'package:get/get.dart';

import '../../pages/home/bindings/home_binding.dart';
import '../../pages/home/views/home_view.dart';
import '../../pages/search/bindings/search_binding.dart';
import '../../pages/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      fullscreenDialog: true,
    ),
  ];
}
