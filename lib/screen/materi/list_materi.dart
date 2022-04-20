import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pbkapp/const/color.dart';
import 'package:pbkapp/controller/materi_c.dart';
import 'package:pbkapp/screen/materi/materi_dummy.dart';

class MateriList extends StatelessWidget {
  const MateriList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MateriC _materiC = Get.put(MateriC());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Materi'),
      ),
      backgroundColor: Warna.bgColor,
      body: ListView.builder(
        itemCount: _materiC.materiss.length,
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return ListMateri(judul: _materiC.materiss[index].judul, idx: index);
        },
      ),
    );
  }
}

class ListMateri extends StatelessWidget {
  final String judul;
  final int idx;
  const ListMateri({Key? key, required this.judul, required this.idx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var isBeforeFinish = box.read((idx-1).toString());
    var isFinish = box.read(idx.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: const FaIcon(FontAwesomeIcons.bookOpen, color: Colors.white),
        tileColor: isFinish == null ? Warna.baseColor : Colors.green,
        title: Text(
          judul,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onTap: () async {
          print(isBeforeFinish.toString());
          (isBeforeFinish == true || idx == 0  )
              ? Get.to(MateriDummy(judul: judul, idx: idx))
              : Get.snackbar(
                  'Maaf',
                  'Anda belum menyelesaikan materi Sebelumnya',
                  backgroundColor: Colors.red,
                  snackPosition:  SnackPosition.TOP,
                );
        },
      ),
    );
  }
}
