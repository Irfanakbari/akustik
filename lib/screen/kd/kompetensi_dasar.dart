import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbkapp/const/color.dart';

class KompetensiDasar extends StatelessWidget {
  const KompetensiDasar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kompetensi Dasar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                  FadedScaleAnimation(
                    scaleCurve:  const Interval(0.0, 0.5, curve: Curves.easeIn),
                    scaleDuration:  const Duration(milliseconds: 900),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Warna.baseColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: Get.width,
                        child:  Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: const [
                              Center(
                                child: Text(
                                  "KOMPETENSI DASAR (KD)",
                                  style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Menganalisis dan memahami tentang Teknologi Informasi yang ada, dan memahami bagian-bagian dari komputer serta fungsinya.",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(height: 20),
                                Center(
                                child: Text(
                                  "INDIKATOR",
                                  style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "1. Memahami Teknologi Informasi dan Komunikasi. \n2. Mengembangkan keterampilan untuk memanfaatkan teknologi informasi dan komunikasi. \n3. Mengembangkan sikap kritis, kreatif, apresiatif dan mandiri dalam penggunaan teknologi informasi dan komunikasi. \n4.  Menghargai karya cipta di bidang teknologi informasi dan komunikasi.",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              )),
        ));
  }
}
