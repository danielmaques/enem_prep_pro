class Question {
  final String id;
  final String text;
  final List<String> options;
  final String correctOption;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOption,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      options: List<String>.from(json['options']),
      correctOption: json['correctOption'],
    );
  }
}
