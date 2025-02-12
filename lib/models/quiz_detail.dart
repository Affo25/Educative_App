import 'AnswerOption.dart';

class QuizDetail {

  String Title;
 int SelectOption;
 bool IsCorrect;
List<AnswerOption> Options;

  QuizDetail(
      this.Title,
      this.SelectOption,
      this.IsCorrect,
      this.Options
      );

  static QuizDetail fromJson(Map<String, dynamic> map)
  {
    List<AnswerOption> options = [];

    var jsonMap = map['Options'] as List;

    jsonMap.forEach((child) => {
      options.add(AnswerOption.fromJson(child))
    });

    return QuizDetail(map['Title'],map['SelectOption'],map['IsCorrect'], options);
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': Title,
      'SelectedOption': SelectOption,
      'IsCorrect': IsCorrect,
      'options': Options,

    };
  }
}
