class MateriModel {
  int id;
  String judul;
  String materi;
  String? gambar;
  String? video;

  MateriModel({required this.id, required this.judul, required this.materi, this.gambar, this.video});
}