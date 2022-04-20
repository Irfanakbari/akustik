import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbkapp/const/color.dart';
import 'package:pbkapp/controller/quiz_c.dart';
import 'question_card.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final QuizC quizC = Get.put(QuizC());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  quizC.nextQuestion;
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
        backgroundColor: const Color(0xFF252c4a),
        // ignore: prefer_const_literals_to_create_immutables
        body: Stack(
          children: [
            SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ProgressBar(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                          text: 'Pertanyaan ${quizC.questionNumber.value}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                              text: ' dari ${quizC.questionss.length}',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: PageView.builder(
                        onPageChanged: quizC.updateNomor,
                        controller: quizC.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: quizC.questionss.length,
                        itemBuilder: (context, index) =>
                            Question(question: quizC.questionss[index]))),
              ],
            ))
          ],
        ));
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
      ),
      child: GetBuilder<QuizC>(
          init: QuizC(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      gradient: Warna.primaryGradient,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );
                }),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(controller.animation.value * 10).round()} Seconds",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}

// Widget timer() {
//   return Center(
//     child: TimerCountdown(
//       descriptionTextStyle: const TextStyle(
//         color: Colors.white,
//         fontSize: 14,
//         fontWeight: FontWeight.normal,
//       ),
//       timeTextStyle: const TextStyle(color: Colors.white),
//       format: CountDownTimerFormat.minutesSeconds,
//       endTime: DateTime.now().add(
//         const Duration(
//           minutes: 1,
//           seconds: 00,
//         ),
//       ),
//       onEnd: () {
//         Get.offNamed('/home');
//         Get.snackbar(
//           'Time is up!',
//           'You have completed the quiz',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//           snackPosition: SnackPosition.TOP,
//           margin: const EdgeInsets.all(20),
//           borderRadius: 10,
//           borderColor: Colors.red,
//           borderWidth: 2,
//           duration: const Duration(seconds: 3),
//         );
//       },
//     ),
//   );
// }
