class Result{
  int ResID;
  int UserID;
  String Title;
  String Name;
  int Score;
  DateTime CreatedOn;

  Result(this.ResID,this.Title,this.UserID, this.Name, this.Score,this.CreatedOn);

  Result.fromJson(Map<String, dynamic> map)
      : ResID = map['ResID'],
        UserID = map['UserID'],
        Title = map['Title'],
        Name = map['Name'],
        Score = map['Score'],
        CreatedOn = DateTime.parse(map['CreatedOn'].toString());


  Map<String, dynamic> toJson() {
    return {
      'ResID':'ResID',
      'UserID': UserID,
      'Title': Title,
      'Name': Name,
      'Score': Score,
      'CreatedOn': CreatedOn
    };
  }
}