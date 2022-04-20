import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:pbkapp/const/color.dart';
import 'package:pbkapp/screen/3dmodel/trid_viewer.dart';
import 'package:pbkapp/screen/materi/list_materi.dart';
import 'package:pbkapp/screen/vidio/yt_player.dart';

class MateriDummy extends StatelessWidget {
  final String judul;
  final int idx;
  const MateriDummy({Key? key, required this.judul, required this.idx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(judul,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Warna.bgColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Stack(
                children: [
                  Column(
                    children: [
                      FadedSlideAnimation(
                        beginOffset: const Offset(10, 0),
                        slideDuration: const Duration(milliseconds: 800),
                        endOffset: const Offset(0, 0.0),
                        child: Container(
                            // container black background with opacity
                            decoration: BoxDecoration(
                              color: Warna.baseColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/image/pc.png',
                                      width: 200,
                                      alignment: Alignment.center,
                                      height: 200,
                                    ),
                                  ),
                                  Text(
                                    "     Secara umum Komputer dapat diartikan sebagai alat bantu bagi manusia untuk menyelesaikan pekerjaannya. Perangkat elektronik yang dapat dipakai untuk mengolah data dengan perantaraan sekumpulan program dan mampu memberikan informasi dari hasil pengolahan tersebut. Dalam bahasa indonesia sering ditulis dengan komputer.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "     Istilah Computer berasal dari kata Compute, yang berarti menghitung. Artinya, setiap proses yang dilaksanakan oleh komputer merupakan proses matematika hitungan. Jadi apapun yang dilakukan oleh komputer, baik penampakan pada layar monitor, suara, gambar, dll. diolah sedemikian rupa dari perhitungan secara elektronik.Komputer adalah hasil dari kemajuan teknologi elektronika dan informatika yang berfungsi sebagai alat bantu untuk menulis, menggambar, menyunting gambar atau foto, membuat animasi, mengoperasikan program analisis ilmiah, simulasi dan untuk kontrol peralatan.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width,
                                    height: 300,
                                    child: ModelViewer(
                                      backgroundColor: Colors.transparent,
                                      src: 'assets/objek/scene.glb',
                                      autoPlay: true,
                                      alt: "A 3D model of an astronaut",
                                      ar: false,
                                      arScale: '1.0',
                                      autoRotate: true,
                                      cameraControls: true,
                                    ),
                                  ),
                                  Text(
                                    "Komponen Komputer :",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "1. Komponen Input",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                   Text(
                                    "Komponen input adalah komponen hardware yang mempunyai tanggung jawab dalam memberikan perintah tugas yang nantinya akan diberikan kepada komputer.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                 
                                  const SizedBox(height: 20),
                                  Text(
                                    "2. Komponen Proses",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                   Text(
                                    "Komponen proses adalah komponen yang memiliki tugas dalam mengolah ataupun memproses suatu perintah yang diberikan oleh brainware agar kemudian ditampilkan pada komponen output komputer.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "3. Komponen Output",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                   Text(
                                    "Komponen output adalah komponen yang bertugas dalam menampilkan informasi dari suatu perintah yang sudah diproses oleh komputer.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            )),
                      ),
                      // container red background with opacity
                      InkWell(
                        onTap: () {
                          Get.to(const YtPlayer(
                            url: 'https://www.youtube.com/watch?v=fHcq2S9tC9U',
                          ));
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.only(top: 10),
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: Get.width,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 45,
                                    child: FaIcon(
                                      FontAwesomeIcons.youtube,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text('Video Penjelasan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const Model1());
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.only(top: 10),
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: Get.width,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 45,
                                    child: FaIcon(
                                      FontAwesomeIcons.cube,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text('3D Model',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(height: 50),
                      // start button with gradation
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.yellow,
                                  Colors.green,
                                  Colors.blue,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(8)),
                        child: FlatButton(
                          onPressed: ()async {
                            final box = GetStorage();
                            box.write(idx.toString(), true);
                            print("oke");

                          },
                          child: const Text(
                            'Latihan',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
