import 'Option.dart';

class Question {
  int QuesID;
  String Title;
  int Score;
  List<Option> Options;
  Question(
      this.QuesID,
      this.Title,
      this.Score,
      this.Options
      );

  static Question fromJson(Map<String, dynamic> map)
  {
    List<Option> options = [];

    var jsonMap = map['Options'] as List;

    jsonMap.forEach((child) => {
      options.add(Option.fromJson(child))
    });

    return Question(map['QuesID'], map['Title'],map['Score'], options);
  }

  Map<String, dynamic> toJson() {
    return {
      'QuesID': QuesID,
      'Title': Title,
      'Score': Score,
      'Options':Options
    };
  }
}
