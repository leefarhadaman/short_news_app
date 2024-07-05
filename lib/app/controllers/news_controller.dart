import 'package:get/get.dart';
import 'package:news_app/app/model/article_model.dart';
import 'package:news_app/app/model/youtube_video_model.dart';
import 'package:news_app/app/service/serivice.dart';
import 'package:news_app/app/service/youtube_service.dart';

class NewsController extends GetxController {
  var topHeadlines = <Article>[].obs;
  var newsShorts = <YoutubeVideo>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var headlines = await NewsService().fetchTopHeadlines();
      var shorts = await YoutubeService().fetchNewsShorts('YOUR_NEWS_CHANNEL_ID'); // Replace with your channel ID
      topHeadlines.assignAll(headlines);
      newsShorts.assignAll(shorts);
    } finally {
      isLoading(false);
    }
  }
}
