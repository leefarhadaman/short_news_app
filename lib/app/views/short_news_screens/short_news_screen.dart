import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:news_app/app/service/youtube_service.dart';
import 'package:news_app/app/model/youtube_video_model.dart';

class ShortNewsScreen extends StatefulWidget {
  final String channelId;

  ShortNewsScreen({required this.channelId});

  @override
  _ShortNewsScreenState createState() => _ShortNewsScreenState();
}

class _ShortNewsScreenState extends State<ShortNewsScreen> {
  late Future<List<YoutubeVideo>> _videosFuture;
  late List<YoutubeVideo> _videos = [];

  @override
  void initState() {
    super.initState();
    _videosFuture = YoutubeService().fetchNewsShorts(widget.channelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Short News'),
      ),
      body: FutureBuilder<List<YoutubeVideo>>(
        future: _videosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching videos: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No videos found.'));
          } else {
            _videos = snapshot.data!;
            return ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                return _buildVideoItem(index);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildVideoItem(int index) {
    final YoutubeVideo video = _videos[index];
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: video.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false, // Start with autoPlay as false
        mute: false,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                // Handle like button action
              },
            ),
            IconButton(
              icon: Icon(Icons.thumb_down),
              onPressed: () {
                // Handle dislike button action
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Handle share button action
              },
            ),
            IconButton(
              icon: Icon(Icons.comment),
              onPressed: () {
                // Handle comment button action
              },
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
