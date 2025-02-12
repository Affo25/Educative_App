class AnswerOption {
  int OptID;
  String Title;
  AnswerOption(this.OptID,this.Title);

  AnswerOption.fromJson(Map<String, dynamic> map)
      : OptID = map['OptID'],
        Title = map['Title'];


  Map<String, dynamic> toJson() {
    return {
      'OptID': OptID,
      'Title': Title
    };
  }
}
