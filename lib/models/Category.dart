import 'SubCategory.dart';

class Category {
  int CatID;
  String Title;
  List<SubCategory> Childs;
  Category(
      this.CatID,
      this.Title,
      this.Childs
      );

  static Category fromJson(Map<String, dynamic> map)
  {
    List<SubCategory> subList = [];

    var jsonMap = map['Childs'] as List;

    jsonMap.forEach((child) => {
      subList.add(SubCategory.fromJson(child))
    });

    return Category(map['CatID'], map['Title'], subList);
  }

  Map<String, dynamic> toJson() {
    return {
      'CatID': CatID,
      'Title': Title,
      'Childs': Childs
    };
  }
}
