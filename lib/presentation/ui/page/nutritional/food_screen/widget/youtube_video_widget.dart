import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoWidget extends StatefulWidget {
  final FoodScreenState state;

  const YouTubeVideoWidget({
    super.key,
    required this.state,
  });

  @override
  _YouTubeVideoWidgetState createState() => _YouTubeVideoWidgetState();
}

class _YouTubeVideoWidgetState extends State<YouTubeVideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.state.food?.foodVideoCooking ?? 'QJZUwiJhKZ0', // Đặt VIDEO_ID của video YouTube ở đây
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onEnded: (meta) {
          print('Video has ended');
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
