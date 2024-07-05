// lib/bindings/shorts_news_binding.dart
import 'package:get/get.dart';
import 'package:news_app/app/views/short_news_screens/short_news_screen_controller.dart';

class ShortsNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortNewsScreenController>(() => ShortNewsScreenController(channelId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw'));
  }
}
