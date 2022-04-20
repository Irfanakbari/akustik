import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbkapp/controller/quiz_c.dart';
import 'package:pbkapp/model/quiz_model.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.question,
  }) : super(key: key);

  final QuizModel question;

  @override
  Widget build(BuildContext context) {
    QuizC quizC = Get.put(QuizC());
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(
                question.options.length,
                (index) => Option(
                    text: question.options[index],
                    index: index,
                    press: () {
                      quizC.checkAnswer(question, index);
                    })),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizC>(
        init: QuizC(),
        builder: (qnC) {
          Color rightColor() {
            if (qnC.isAnswered) {
              if (index == qnC.correctAnswer) {
                return Colors.green;
              } else if (index == qnC.selectedAnswer &&
                  qnC.selectedAnswer != qnC.correctAnswer) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }
          IconData rightIcon(){
            return rightColor() ==  Colors.red ? Icons.close : Icons.check;
          }

          return GestureDetector(
            onTap: press,
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: rightColor(),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: rightColor(),
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: rightColor() == Colors.grey
                          ? Colors.transparent
                          : rightColor(),
                      border: Border.all(
                        color: rightColor(),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: rightColor() == Colors.grey
                        ? null
                        : Icon(
                            rightIcon(),size: 16,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}