class feedback {
  int FeedbackID;
  int UserID;
  String Title;
   feedback(this.FeedbackID, this.UserID, this.Title);

  feedback.fromJson(Map<String, dynamic> map)
      : FeedbackID = map['FeedbackID'],
        UserID = map['UserID'],
        Title = map['Title'];

  Map<String, dynamic> toJson() {
    return {
      'FeedbackID': FeedbackID,
      'Title': Title,
      'UserID': UserID,
    };
  }
}
class Report {
  int ReportID;
  int UserID;
  String Title;
  String ReportType;
  Report(this.ReportID, this.UserID, this.Title,this.ReportType);

  Report.fromJson(Map<String, dynamic> map)
      : ReportID = map['ReportID'],
        UserID = map['UserID'],
        Title = map['Title'],
        ReportType = map['ReportType'];

  Map<String, dynamic> toJson() {
    return {
      'ReportID': ReportID,
      'Title': Title,
      'UserID': UserID,
      'ReportType': ReportType
    };
  }
}