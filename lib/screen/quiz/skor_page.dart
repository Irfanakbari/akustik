import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbkapp/const/color.dart';
import 'package:pbkapp/controller/quiz_c.dart';

class Skor extends StatelessWidget {
  const Skor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizC quizC = Get.put(QuizC());
    return Scaffold(
      backgroundColor: Warna.bgColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Skor Anda',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '${quizC.jumlahBenar * 10} / ${quizC.questionss.length * 10}',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
