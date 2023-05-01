class SubCategory {
  int SubID;
  String Name;
  String Status;
  String CreatedOn;
  int CatID;
  SubCategory(this.SubID,this.Name,this.Status,this.CreatedOn,this.CatID);

  SubCategory.fromJson(Map<String, dynamic> map)
      : SubID = map['SubID'],
        Name = map['Name'],
        Status = map['Status'],
        CreatedOn = map['CreatedOn'],
        CatID = map['CatID'];


  Map<String, dynamic> toJson() {
    return {
      'SubID': SubID,
      'Name': Name,
      'Status': Status,
      'CreatedOn': CreatedOn,
      'CatID': CatID
    };
  }
}
