import 'package:get/get.dart';
import 'package:pbkapp/const/materi_list.dart';
import 'package:pbkapp/model/materi_model.dart';


class MateriC extends GetxController{
  final List<MateriModel> _materis = materis.map((e) => MateriModel(
    id: e['id'],
    judul: e['judul'],
    materi: e['materi'],
    gambar: e['gambar'],
    video: e['video'],
  )).toList();

  List<MateriModel> get materiss => _materis;

}