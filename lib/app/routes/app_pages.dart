// lib/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:news_app/app/routes/app_routes.dart';
import 'package:news_app/app/views/headlines_screen/headlines_binding.dart';
import 'package:news_app/app/views/headlines_screen/headlines_screen.dart';
import 'package:news_app/app/views/short_news_screens/short_news_screen.dart';
import 'package:news_app/app/views/short_news_screens/short_news_screen_binding.dart';
import 'package:news_app/main.dart';


class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.HEADLINES,
      page: () => HeadlinesScreen(),
      binding: HeadlinesBinding(),
    ),
    GetPage(
      name: AppRoutes.SHORTS_NEWS,
      page: () => ShortNewsScreen(channelId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw',),
      binding: ShortsNewsBinding(),
    ),
  ];
}
