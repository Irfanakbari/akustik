import 'package:get/get.dart';
import 'package:pbkapp/const/video_list.dart';
import 'package:pbkapp/screen/vidio/video_model.dart';

class VideoC extends GetxController {
  
  final List<VideoModel> _video = videos.map((e) => VideoModel(
    judul: e['judul'],
    url: e['url'],
  )).toList();

  List<VideoModel> get videoss => _video;
}