import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.youtubeKey});

  final String youtubeKey;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      // key: widget.youtubeKey,
    videoId: widget.youtubeKey,
      params: const YoutubePlayerParams(
        showControls: true,
        enableJavaScript: true,
        showFullscreenButton: true,
      ),
    );

  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          return true;
        },
        child: YoutubePlayerScaffold(
          autoFullScreen: true,
          defaultOrientations: const [
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ],
          builder: (context, player) => player, controller: _controller),
      ),
    );
  }
}