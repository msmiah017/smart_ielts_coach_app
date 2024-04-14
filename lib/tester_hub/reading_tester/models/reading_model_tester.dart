class ReadingTestModel {
  final String title;
  final List<ReadingSectionModel> sections;

  ReadingTestModel({
    required this.title,
    required this.sections,
  });
}

class ReadingSectionModel {
  final String title;
  final List<ReadingQuestionModel> questions;

  ReadingSectionModel({
    required this.title,
    required this.questions,
  });
}

enum ReadingQuestionType {
  multipleChoice,
  trueFalse,
  shortAnswer,
  // Add more types as needed
}

class ReadingQuestionModel {
  final ReadingQuestionType type;
  final String question;
  final List<String> options;
  final String correctAnswer;

  ReadingQuestionModel({
    required this.type,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}


class ReadingResultModel {
  final String testTitle;
  final Map<String, dynamic> sectionResults;

  ReadingResultModel({
    required this.testTitle,
    required this.sectionResults,
  });
}
