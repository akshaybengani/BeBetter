import 'package:bebetter/models/expense.dart';

class User{

  User();

  String id;
  DateTime createdAt;
  String accessKey;
  List<Expense> expenseList;


  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    accessKey = json["access_key"];
    

    if (json["created_at"] != null) {
      createdAt = DateTime.parse(json["created_at"]);
    }
    
    if (json["list_expense"] != null) {
      expenseList = Expense.listFromJson(json["list_expense"]);
    }

  }



}