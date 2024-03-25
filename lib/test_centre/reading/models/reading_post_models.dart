class ReadingPost {
  String profileImg;
  String accountName;
  List<String> passageTitles;
  int performed;
  int maxScore;
  DifficultyLevel difficultyLevel;
  ReadingPost(this.profileImg, this.accountName, this.passageTitles,
      this.performed, this.maxScore, this.difficultyLevel);
}

enum DifficultyLevel { veryEasy, easy, medium, difficult, veryDifficult }
