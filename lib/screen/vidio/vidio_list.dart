import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pbkapp/const/color.dart';
import 'package:pbkapp/controller/video_c.dart';
import 'package:pbkapp/screen/vidio/yt_player.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VideoC _materiC = Get.put(VideoC());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('List Video'),
      ),
      backgroundColor: Warna.bgColor,
      body: ListView.builder(
        itemCount: _materiC.videoss.length,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return ListVideo(
              judul: _materiC.videoss[index].judul,
              url: _materiC.videoss[index].url);
        },
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final String judul;
  final String url;
  const ListVideo({Key? key, required this.judul, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: const FaIcon(FontAwesomeIcons.bookOpen, color: Colors.white),
        onTap: () {
          Get.to(YtPlayer(url: url));
        },
        tileColor: Warna.baseColor,
        title: Text(
          judul,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
