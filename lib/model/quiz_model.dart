class QuizModel {
  final int id, answer;
  final String question;
  final List<String> options;

  QuizModel(
      {required this.id,
      required this.answer,
      required this.question,
      required this.options});
}
