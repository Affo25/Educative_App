class UserData {
  int UserID;
  String Name;
  String Email;
  String Password;
  String Gender;
  int    Age;
  String PhoneNo;
  String? CreatedOn;

  UserData(
    this.UserID,
    this.Name,
    this.Email,
    this.Password,
    this.Gender,
    this.Age,
    this.PhoneNo,
    this.CreatedOn,
  );

  UserData.fromJson(Map<String, dynamic> map)
      : UserID = map['UserID'],
        Name = map['Name'],
        Email = map['Email'],
        Password = map['Password'],
        Gender = map['Gender'],
        Age = map['Age'],
        PhoneNo = map['PhoneNo'],
        CreatedOn = map['CreatedOn'];

  Map<String, dynamic> toJson() {
    return {
      'UserID': UserID,
      'Name': Name,
      'Email': Email,
      'Password': Password,
      'Gender': Gender,
      'Age': Age,
      'PhoneNo': PhoneNo,
      'CreatedOn': CreatedOn,
    };
  }
}
