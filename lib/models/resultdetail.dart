class ResultDetail{
  int ID;
  int UserID;
  int QuesID;
  int SelectOption;
  bool IsCorrect;
  int Score;
  int ResID;

  ResultDetail(this.ID,this.UserID, this.QuesID,this.SelectOption,this.IsCorrect, this.Score, this.ResID);

  ResultDetail.fromJson(Map<String, dynamic> map)
      : ID = map['ID'],
        UserID = map['UserID'],
        QuesID = map['QuesID'],
        SelectOption = map['SelectOption'],
        IsCorrect = map['IsCorrect'],
         Score = map['Score'],
         ResID = map['ResID'];


  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'UserID': UserID,
      'QuesID': QuesID,
      'SelectOption': SelectOption,
      'IsCorrect': IsCorrect,
      'Score': Score,
      'ResID': ResID,
    };
  }
}