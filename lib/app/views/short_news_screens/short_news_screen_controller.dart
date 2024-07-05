import 'package:get/get.dart';
import 'package:news_app/app/model/youtube_video_model.dart';
import 'package:news_app/app/service/youtube_service.dart';

class ShortNewsScreenController extends GetxController {
  var isLoading = true.obs;
  var videos = <YoutubeVideo>[].obs;
  late YoutubeService _youtubeService;
  final String channelId;

  ShortNewsScreenController({required this.channelId});

  @override
  void onInit() {
    super.onInit();
    _youtubeService = YoutubeService();
    fetchVideos();
  }

  void fetchVideos() async {
    try {
      isLoading(true);
      var videoList = await _youtubeService.fetchNewsShorts(channelId);
      if (videoList != null && videoList.isNotEmpty) {
        videos.assignAll(videoList);
      }
    } catch (e) {
      print('Error fetching videos: $e');
    } finally {
      isLoading(false);
    }
  }
}
