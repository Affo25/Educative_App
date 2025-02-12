class Option {
  int OptID;
  String Title;
  int QuesID;
  bool IsCorrect;
  String Status;
  Option(this.OptID,this.Title,this.QuesID,this.IsCorrect,this.Status);

  Option.fromJson(Map<String, dynamic> map)
      : OptID = map['OptID'],
        Title = map['Title'],
        QuesID = map['QuesID'],
        Status = map['Status'],
        IsCorrect = map['IsCorrect'];


  Map<String, dynamic> toJson() {
    return {
      'OptID': OptID,
      'Title': Title,
      'QuesID': QuesID,
      'Status': Status,
      'IsCorrect': IsCorrect
    };
  }
}
