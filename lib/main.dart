import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pbkapp/screen/kd/kompetensi_dasar.dart';
import 'package:pbkapp/screen/materi/materi_page.dart';
import 'package:pbkapp/screen/quiz/quiz_page.dart';
import 'package:pbkapp/screen/vidio/vidio_list.dart';
import 'screen/homepage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PBK APP',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/kd', page: () => const KompetensiDasar()),
        GetPage(name: '/materi', page: () => const Materi1()),
        GetPage(name: '/video', page: () => const VideoList()),
        GetPage(name: '/quiz', page: () => const Quiz()),
      ],
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
