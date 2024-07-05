// lib/app/model/youtube_video_model.dart

class YoutubeVideo {
  final String title;
  final String videoId;
  final String thumbnailUrl;

  YoutubeVideo({
    required this.title,
    required this.videoId,
    required this.thumbnailUrl,
  });

  factory YoutubeVideo.fromJson(Map<String, dynamic> json) {
    return YoutubeVideo(
      title: json['snippet']['title'],
      videoId: json['id']['videoId'],
      thumbnailUrl: json['snippet']['thumbnails']['default']['url'],
    );
  }
}
