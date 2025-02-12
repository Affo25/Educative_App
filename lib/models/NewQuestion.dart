import 'Option.dart';

class NewQuestion {
  int QuesID;
  String Title;
  int Score;
  int CatID;
  int SubID;
  int UserID;
  NewQuestion(
      this.QuesID,
      this.CatID,
      this.SubID,
      this.Title,
      this.Score,
      this.UserID
      );

  static NewQuestion fromJson(Map<String, dynamic> map)
  {

    return NewQuestion(map['QuesID'], map['SubID'],map['catID'], map['Title'],map['Score'],map['UserID']);
  }

  Map<String, dynamic> toJson() {
    return {
      'QuesID': QuesID,
      'CatID': CatID,
      'SubID': SubID,
      'Title': Title,
      'Score': Score,
      'UserID':UserID
    };
  }
}
