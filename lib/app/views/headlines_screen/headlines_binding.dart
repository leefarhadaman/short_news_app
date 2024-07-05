// lib/bindings/headlines_binding.dart
import 'package:get/get.dart';
import 'package:news_app/app/views/headlines_screen/headline_controller.dart';


class HeadlinesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeadlinesController>(() => HeadlinesController());
  }
}
