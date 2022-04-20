import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbkapp/const/quiz_list.dart';
import 'package:pbkapp/model/quiz_model.dart';
import 'package:pbkapp/screen/quiz/skor_page.dart';

class QuizC extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  // getter untuk animasi
  Animation get animation => _animation;

  final List<QuizModel> _questions = questions
      .map((qs) => QuizModel(
          id: qs['id'],
          question: qs['question'],
          options: qs['options'],
          answer: qs['answer_index']))
      .toList();

  List<QuizModel> get questionss => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAnswer;
  int get correctAnswer => _correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => _selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _jumlahBenar = 0;
  int get jumlahBenar => _jumlahBenar;

  @override
  void onClose() {
    _pageController.dispose();
    _animationController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    // mulai timer
    _animationController.forward().whenComplete(() => nextQuestion());

    _pageController = PageController(initialPage: 0);

    super.onInit();
  }

  void checkAnswer(QuizModel questio, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = questio.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _jumlahBenar++;
      Get.snackbar(
        'Jawaban Benar',
        'Selamat jawaban anda benar',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(10),
        colorText: Colors.white,
        animationDuration: const Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        'Jawaban Salah',
        'Maaf jawaban anda salah',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(10),
        colorText: Colors.white,
        animationDuration: const Duration(seconds: 1),
      );
    }

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);

      // reset timer ke 0
      _animationController.reset();
      // mulai timer
      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(const Skor());
    }
  }

  void updateNomor(int index) {
    _questionNumber.value = index + 1;
  }
}
