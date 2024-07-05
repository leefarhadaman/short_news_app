// lib/controllers/headlines_controller.dart
import 'package:get/get.dart';
import 'package:news_app/app/model/article_model.dart';
import 'package:news_app/app/service/serivice.dart';

class HeadlinesController extends GetxController {
  var headlines = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchHeadlines();
    super.onInit();
  }

  void fetchHeadlines() async {
    try {
      isLoading(true);
      var articles = await NewsService().fetchTopHeadlines();
      headlines.assignAll(articles);
    } finally {
      isLoading(false);
    }
  }
}
