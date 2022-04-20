import 'package:flutter/material.dart';
import 'package:pbkapp/const/color.dart';
import 'package:pod_player/pod_player.dart';

class YtPlayer extends StatefulWidget {
  final String url;
  const YtPlayer({Key? key, required this.url}) : super(key: key);

  @override
  State<YtPlayer> createState() => _YtPlayerState();
}

class _YtPlayerState extends State<YtPlayer> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(isLooping: false),
      playVideoFrom: PlayVideoFrom.youtube(widget.url),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.bgColor,
      body: PodVideoPlayer(
          alwaysShowProgressBar: false,
          backgroundColor: Warna.bgColor,
          controller: controller),
    );
  }
}
